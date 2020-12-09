class HabitPolicy < ApplicationPolicy

  def create?
    user.role == "Manager" || user.role =="RH"
  end

  def update?
    user.role == "Manager" || user.role =="Newcomer"
  end

  def destroy?
    user.role == "Manager" || user.role =="RH"
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
