class MissionsPolicy < ApplicationPolicy

  def new?
    user.role == "manager"
  end

  def create?
    new?
  end

  # le manager pourra changer UNIQUEMENT le contenu et le newcomer pourra changer UNIQUEMENT son status.
  # boutons a ajuster dans le view
  def edit?
    user.role == "manager" || user.role == "newcomer"
  end

  def update?
    edit?
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
