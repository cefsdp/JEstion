class JuniorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user.admin? ? true : false
  end

  def create?
    new?
  end
end
