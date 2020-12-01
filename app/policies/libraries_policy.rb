class LibrariesPolicy < ApplicationPolicy

  def create?
    user.role =="rh"
  end

  def destroy?
    user.role =="rh"
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
