class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def my_bookings?
    true
  end

  def destroy?
    user == record.user
  end
end
