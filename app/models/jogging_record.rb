class JoggingRecord < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :time, :distance, :user_id
end
