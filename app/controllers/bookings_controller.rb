class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).reverse
  end

  def create
    @booking = Booking.new(bookings_params)
    @field = Field.find(params[:field_id])
    @booking.field = @field
    @booking.user = current_user
    @booking.price_per_day = @field.price
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = @booking.errors.full_messages.first
      render 'fields/show', status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @field = @booking.field
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(bookings_params)
    authorize @booking
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:date_from, :date_to)
  end
end
