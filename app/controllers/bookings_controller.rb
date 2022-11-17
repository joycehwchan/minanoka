class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show update edit destroy]

  def index
    @bookings = policy_scope(Booking).reverse
  end

  def create
    set_new_booking
    authorize @booking
    if @booking.save
      flash[:success] = "Booking created!"
      redirect_to bookings_path
    else
      flash[:alert] = @booking.errors.full_messages.first
      render 'fields/show', status: :unprocessable_entity
    end
  end

  def edit
    @field = @booking.field
    authorize @booking
  end

  def update
    @booking.update(bookings_params)
    authorize @booking
    flash[:alert] = @booking.errors.full_messages.first
    flash[:success] = "Booking updated!"
    redirect_to bookings_path
  end

  def destroy
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

  def set_new_booking
    @booking = Booking.new(bookings_params)
    @field = Field.find(params[:field_id])
    @booking.field = @field
    @booking.user = current_user
    @booking.price_per_day = @field.price
  end
end
