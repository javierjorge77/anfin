class ConsultationPolicy < ApplicationPolicy

  end

  def create?
    return true
  end

  def new?
    create?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
end
