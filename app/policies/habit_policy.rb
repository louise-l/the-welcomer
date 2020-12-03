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

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
