class ConsultationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true if user.id == record.user.id
  end

  def create?
    return true
  end

  def new?
    create?
  end
end
