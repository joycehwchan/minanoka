class BookingsController < ApplicationController
  # before_action :authenticate_user!, :create

  def index
    @bookings = policy_scope(Booking)
  end

  def create
    raise
    redirect_to new_user_registration_url unless user_signed_in?
    @booking = Booking.new(params)
    @field = Field.find(params[:field_id])
    @booking.field = @field
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to root_path
    else
      render "fields/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :price_per_day, :user_id, :field_id, :status)
  end
end
