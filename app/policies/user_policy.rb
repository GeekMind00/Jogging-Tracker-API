class UserPolicy < ApplicationPolicy
  def index?
    user.admin? or user.moderator?
  end

  def show?
    user.admin? or user.moderator?
  end

  def create?
    user.admin? or user.moderator?
  end

  def update?
    user.admin? or user.moderator?
  end

  def destroy?
    user.admin? or user.moderator?
  end
end
