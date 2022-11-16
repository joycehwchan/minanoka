class Landowner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:landowner, Booking]).reverse
  end
end
