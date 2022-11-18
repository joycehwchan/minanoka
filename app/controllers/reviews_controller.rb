class ReviewsController < ApplicationController
  before_action :set_new_review, only: %i[create]

  def create
    set_new_review
    authorize @review
    respond_to do |format|
      if @review.save
        flash[:success] = "Review Posted!"
        format.html { redirect_to field_path(@field) }
        format.json
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json
        flash[:alert] = "Ops! Something went wrong..."
      end
    end
    # redirect_to field_path(@field)
  end

  private

  def set_new_review
    @review = Review.new(review_params)
    @field = Field.find(params[:field_id])
    @review.user = current_user
    @review.field = @field
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
