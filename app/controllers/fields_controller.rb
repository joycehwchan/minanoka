class FieldsController < ApplicationController

  def show
    @field = Field.find(params[:id])
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)
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
