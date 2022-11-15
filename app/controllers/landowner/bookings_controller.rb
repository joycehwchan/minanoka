class Landowner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:landowner, Booking])
  end
end
