class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_item
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_item, only: [:show]

  def index
  end

  def show
    @reviews = Review.where(item: params[:id])
    @review = @item.reviews.new
  end

  def category
    @category = params[:category]
    @items = Item.send @category 
  end

  def search
    @items = []
    if params[:query].present?
      @items = Item.search(params[:query], {
        fields: [:title, :description],
        match: :word_start,
        limit: 10,
        load: false
      })
    end
  end

  def autocomplete
    render json: Item.search(params[:query], {
      fields: [:title, :description],
      match: :word_start,
      limit: 10,
      load: false
    }).map(&:title)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :item_type, :is_featured)
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
