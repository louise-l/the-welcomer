class LibraryPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    user.role =="hr"
  end

  def destroy?
    user.role =="hr"
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
