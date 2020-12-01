class HabitsPolicy < ApplicationPolicy

  def new?
    user.role == "manager" || user.role =="rh"
  end

  def create?
    new?
  end

  def edit?
    user.role == "manager" || user.role =="rh"
  end

  def update?
    edit?
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
