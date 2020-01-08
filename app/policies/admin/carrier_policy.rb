class Admin::CarrierPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
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
