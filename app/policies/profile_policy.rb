class ProfilePolicy < ApplicationPolicy

  def new?
    user.role == "RH" || user.role == "Manager"
  end

  def create?
    user.role == "RH" || user.role == "Manager"
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
