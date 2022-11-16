class BookingsController < ApplicationController
  before_action :authenticate_user!, :create

  def index
    @bookings = policy_scope(Booking)
  end

  def create
    raise
    @booking = Booking.new(bookings_params)
    @field = Field.find(params[:field_id])
    @booking.field = @field
    @booking.price_per_day = 10_000
    @booking.user = current_user
    authorize @booking
    if @booking.save!
      redirect_to bookings_path
    else
      render "bookings/from", status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:date_from, :date_to, :user_id, :field_id, :price_per_day, :status)
  end
end
