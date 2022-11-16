class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).reverse
  end

  def create
    @booking = Booking.new(bookings_params)
    @field = Field.find(params[:field_id])
    @booking.field = @field
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = @booking.errors.full_messages.first
      render 'fields/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to bookings_path, status: :see_other
  end

  private

  def bookings_params
    params.require(:booking).permit(:date_from, :date_to, :user_id, :field_id, :price_per_day, :status)
  end
end
