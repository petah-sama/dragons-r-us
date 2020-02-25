class DragonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      true
    end

    def update?
      check_user
    end

    def destroy?
      check_user
    end

    private

    def check_user
      record.user == user
    end
  end
end
