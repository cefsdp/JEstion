class JuniorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.joins(:users).where(users: user.id)
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
