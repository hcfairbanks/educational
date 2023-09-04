class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.role.permissions.where(model: "users", action: "not").first ? true : false
  end

  def show?
    # a condition which returns a boolean value
  end

end