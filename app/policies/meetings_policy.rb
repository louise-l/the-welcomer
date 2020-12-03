class MeetingsPolicy < ApplicationPolicy

  def index?
    user.company == record
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
