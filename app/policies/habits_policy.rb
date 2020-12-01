class HabitsPolicy < ApplicationPolicy

  def create?
    user.role == "manager" || user.role =="rh"
  end

  def update?
    user.role == "manager" || user.role =="rh"
  end

  def destroy?
    user.role == "manager" || user.role =="rh"
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
