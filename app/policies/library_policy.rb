class LibraryPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    user.role =="RH"
  end

  def destroy?
    user.role =="RH"
  end

  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end
end
