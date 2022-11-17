class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.bookings
    end
  end

  def edit?
    update?
  end

  def update?
    record.user == user || record.field.user == user
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
