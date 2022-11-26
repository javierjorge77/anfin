class ConsultationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
       scope.where(user_id: user.id )
     end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def new?
    create?
  end


end
