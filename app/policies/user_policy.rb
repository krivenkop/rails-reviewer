class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin? || @user == record
  end

  def destroy?
    admin? || @user == record
  end

  private

  def admin?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope
      else
        raise Pundit::NotAuthorizedError, 'You do not have permissions'
      end
    end
  end
end
