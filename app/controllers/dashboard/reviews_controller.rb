class Dashboard::ReviewsController < DashboardController
  before_action :set_review, only: [:destroy]
  before_action :set_item

  def destroy
    @review.destroy
    redirect_to dashboard_item_path(@review.item_id), notice: 'Review was successfully deleted.'
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
end
