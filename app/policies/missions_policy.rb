class MissionsPolicy < ApplicationPolicy


  def create?
    user.role == "manager"
  end

  # le manager pourra changer UNIQUEMENT le contenu et le newcomer pourra changer UNIQUEMENT son status.
  # boutons a ajuster dans le view

  def update?
    user.role == "manager" || user.role == "newcomer"
  end

  def destroy?
    user.role == "manager"
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
