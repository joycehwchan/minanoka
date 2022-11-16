class FieldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @fields = policy_scope(Field.search(params))
  end

  def show
    @booking = Booking.new
    @booking.user = current_user
    @field = Field.find(params[:id])
    authorize @field
  end

  def new
    @field = Field.new
    authorize @field
  end

  def create
    @field = Field.new(fields_params)
    @field.user = current_user
    authorize @field
    if @field.save
      redirect_to fields_path(@field)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def fields_params
    params.require(:field).permit(:name, :size, :description, :location, :price, :user_id, images: [])
  end
end
