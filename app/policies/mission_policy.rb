class MissionPolicy < ApplicationPolicy
  def index
    user.role =='Manager' || user.role == 'Teammate'
  end

  def create?
    user.role == "Manager"
  end

  # le Manager pourra changer UNIQUEMENT le contenu et le newcomer pourra changer UNIQUEMENT son status.
  # boutons a ajuster dans le view

  def update?
    user.role == "Manager" || user.role == "Newcomer"
  end

  def destroy?
    user.role == "Manager"
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
