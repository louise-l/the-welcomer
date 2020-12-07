class ProfilePolicy < ApplicationPolicy

  def new?
    user.role == "RH" || user.role == "Manager"
  end

  def create?
    user.role == "RH" || user.role == "Manager"
  end

  def update?
    true
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
