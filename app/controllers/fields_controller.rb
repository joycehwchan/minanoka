class FieldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_field, only: %i[update edit destroy]
  def index
    @fields = policy_scope(Field.search(params))
    @markers = @fields.geocoded.map do |field|
      {
        lat: field.latitude,
        lng: field.longitude,
        popup_html: render_to_string(partial: "fields/map_popup", locals: { field: field }),
        marker_html: render_to_string(partial: 'fields/map_marker', locals: { field: field })
      }
    end
  end

  def show
    @booking = Booking.new
    @booking.user = current_user
    @field = Field.find(params[:id])
    authorize @field
    @marker =
      [{
        lat: @field.latitude,
        lng: @field.longitude,
        popup_html: render_to_string(partial: "fields/map_popup", locals: { field: @field })
        # marker_html: render_to_string(partial: 'fields/map_marker', locals: { field: @field })
      }]
  end

  def new
    @field = Field.new
    authorize @field
  end

  def create
    set_new_field
    if @field.save
      current_user.landowner = true
      current_user.save
      flash[:success] = "Field created!"
      redirect_to landowner_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @field.update(fields_params)

    redirect_to landowner_bookings_path
  end

  def destroy
    @field.destroy
    redirect_to landowner_bookings_path, status: :see_other
  end

  private

  def set_field
    @field = Field.find(params[:id])
    authorize @field
  end

  def set_new_field
    @field = Field.new(fields_params)
    @field.user = current_user
    authorize @field
  end

  def fields_params
    params.require(:field).permit(:name, :size, :rich_description, :location, :price, images: [])
  end
end
