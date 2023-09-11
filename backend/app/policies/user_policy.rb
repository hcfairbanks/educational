class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # Scoping on index
  # Let an admin see all students
  # Let a teacher see only their students


  # https://stackoverflow.com/questions/39148163/pundit-authorization-in-index

  def index?
    # Not sure if I want to expand this
    # might create a super unicorn permission
    basic_check("users", "index")
  end

  def show?
    basic_check("users", "show")
  end

  def edit?
    basic_check("users", "edit")
  end

  def update?
    basic_check("users", "update")
  end

  def destroy?
    basic_check("users", "destroy")
  end

end