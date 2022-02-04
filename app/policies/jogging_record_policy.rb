class JoggingRecordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def index?
    user.admin? or user.user?
  end

  def show?
    user.admin? or user.user?
  end

  def create?
    user.admin? or user.user?
  end

  def update?
    user.admin? or user.user?
  end

  def destroy?
    user.admin? or user.user?
  end
end
