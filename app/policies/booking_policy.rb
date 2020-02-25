class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    check_user
  end

  def show?
    true
  end

  def my_bookings?
    true
  end

  private

  def check_user
    record.user == user
  end
end
