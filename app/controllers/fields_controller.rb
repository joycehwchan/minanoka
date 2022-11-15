class FieldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @fields = policy_scope(Field.search(params))
  end

  def show
    @field = Field.find(params[:id])
    authorize @field
  end

  def new
    @field = Field.new
    authorize @field
  end

  def create
    @field = Field.new(field_params)
    authorize @field
    if @field.save
      redirect_to fields_path(@field)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def field_params
    params.require(:field).permit(:name, :size, :description, :location, :price)
  end
end
