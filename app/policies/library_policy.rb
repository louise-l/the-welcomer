class LibraryPolicy < ApplicationPolicy

  def new?
    user.role =="hr"
  end

  def create?
    user.role =="RH"
  end

  def destroy?
    user.role =="RH"
  end

  def show
    true
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
