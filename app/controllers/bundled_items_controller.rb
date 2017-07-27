class BundledItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_item
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_bundled_item, only: [:show]

  def index
    @bundled_items = BundledItem.all
  end

  def show
    @items = @bundled_item.set_items
  end

  private
    def set_bundled_item
      @bundled_item = BundledItem.find(params[:id])
    end

    def bundled_item_params
      params.require(:bundled_item).permit(:discounted_price, :title)
    end

  def invalid_item
    logger.error "Attempt to access invalid item #{params[:id]}"
    redirect_to landing_index_path, notice: 'Invalid Item'
  end

  def invalid_method
    logger.error "Attempt to access invalid method"
    redirect_to landing_index_path, notice: 'Invalid method'
  end

end
