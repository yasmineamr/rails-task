class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_review
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_item

  def edit
  end

  def create
    @review = @item.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to item_path(@review.item_id), notice: 'Review was successfully added.'
    else
      redirect_to item_path(@review.item_id), notice: 'Error in submitting the review, please try again!'
    end
  end

  def update
    if @review.user_id == current_user.id
      if @review.update(review_params)
        redirect_to item_path(@review.item_id), notice: 'Review was successfully updated.'
      else
        redirect_to item_path(@review.item_id), notice: 'Error in updating the review, please try again!'
      end
    else
      redirect_to item_path(@review.item_id), notice: 'You can not update this review!'
    end
  end

  def destroy
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to item_path(@item.id), notice: 'Review was successfully deleted.'
    else
      redirect_to item_path(@item.id), notice: 'You can not delete this review!'
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def review_params
      params.require(:review).permit(:item_id, :text, :rate)
    end

    def invalid_video
      logger.error "Attempt to access invalid item #{params[:id]}"
      redirect_to landing_index_path, notice: 'Invalid Video'
    end

    def invalid_method
      logger.error "Attempt to access invalid method"
      redirect_to landing_index_path, notice: 'Invalid method'
    end
end


























