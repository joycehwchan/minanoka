class Landowner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:landowner, Booking]).reverse
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(bookings_params)
    authorize @booking
    redirect_to landowner_bookings_path
  end

private

  def bookings_params
    params.require(:booking).permit(:status)
  end
end
