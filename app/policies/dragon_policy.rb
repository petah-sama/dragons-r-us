class DragonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    check_user
  end

  def destroy?
    check_user
  end

   def my_dragons?
    true
  end

  private

  def check_user
    record.user == user
  end
end
