class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    Booking.where("user_id = ? AND field_id = ? AND date_to <= ?, #{user}, #{record.field}, #{Time.now}") ? true : false
  end
end
