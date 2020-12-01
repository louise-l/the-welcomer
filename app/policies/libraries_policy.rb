class LibrariesPolicy < ApplicationPolicy

  def new?
    user.role =="rh"
  end

  def create?
    new?
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
