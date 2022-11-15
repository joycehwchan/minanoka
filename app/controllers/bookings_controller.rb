class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end
end
