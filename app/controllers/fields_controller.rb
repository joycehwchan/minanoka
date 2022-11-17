class FieldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @fields = policy_scope(Field.search(params))

    # Not working properly yet...
    # @fields = @fields.geocoded.map do |flat|
    #   {
    #     lat: flat.latitude,
    #     lng: flat.longitude
    #   }
    # end
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
    @field.featured_img = @field.images.first.key
    authorize @field
    if @field.save
      current_user.landowner = true
      current_user.save
      redirect_to fields_path(@field)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @field = Field.find(params[:id])
    @field.destroy
    authorize @field
    redirect_to landowner_bookings_path, status: :see_other
  end

  private

  def fields_params
    params.require(:field).permit(:name, :size, :description, :location, :price, :user_id, images: [])
  end
end
