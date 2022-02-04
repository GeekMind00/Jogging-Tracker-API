class JoggingRecordsController < ApplicationController
  before_action :authenticate_user!

  # - Report on average speed & distance per week.
  def index
    authorize_role

    @jogging_records = policy_scope(JoggingRecord)
    if params.key?(:from) && params.key?(:to)
      @jogging_records = @jogging_records.where('date >= :from AND date <= :to',
                                                { from: params[:from], to: params[:to] })
    end

    render json: decorate_multiple, status: :ok
  end

  def show
    authorize_role

    @jogging_record = policy_scope(JoggingRecord).find(params[:id])

    render json: decorate, status: :ok
  end

  def create
    authorize_role

    jogging_record_parameters = jogging_record_params
    jogging_record_parameters[:user_id] = current_user.id if current_user.user?

    @jogging_record = JoggingRecord.create!(jogging_record_parameters)

    render json: decorate, status: 201
  end

  def update
    authorize_role

    jogging_record_parameters = jogging_record_params
    jogging_record_parameters[:user_id] = current_user.id if current_user.user?

    @jogging_record = policy_scope(JoggingRecord).find(params[:id])
    @jogging_record.update!(jogging_record_parameters)

    render json: decorate, status: :ok
  end

  def destroy
    authorize_role

    policy_scope(JoggingRecord).find(params[:id]).destroy!

    render json: { message: "JoggingRecord with id: #{params[:id]} has been deleted successfully" }, status: 202
  end

  def weekly_report
    @jogging_records = policy_scope(JoggingRecord).where('date >= :from AND date <= :to',
                                                         { from: Date.today - 7, to: Date.today })

    render json: decorate_report, status: :ok
  end

  private

  def jogging_record_params
    params.permit(:date, :distance, :time, :user_id, :from, :to)
  end

  def authorize_role
    authorize JoggingRecord
  end

  def decorate
    {
      id: @jogging_record.id,
      user_id: @jogging_record.user_id,
      date: @jogging_record.date,
      time: "#{@jogging_record.time} minutes",
      distance: "#{@jogging_record.distance} meters"
    }
  end

  def decorate_multiple
    decorated_response = []
    @jogging_records.each do |jogging_record|
      @jogging_record = jogging_record
      decorated_response << decorate
    end
    decorated_response
  end

  def decorate_report
    speeds = 0
    n = @jogging_records.count
    average_distance = @jogging_records.average(:distance)

    @jogging_records.each do |jogging_record|
      speeds += jogging_record.distance / jogging_record.time
    end
    average_speed = speeds / n

    {
      average_distance: "#{average_distance} meters",
      average_speed: "#{average_speed} meters/minute"
    }
  end
end
