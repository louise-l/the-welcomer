class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.company == record
  end

  def overview?
    user.company == record
  end
end
