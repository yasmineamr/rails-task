class Dashboard::ItemsController < DashboardController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_item
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @reviews = Review.where(item: params[:id])
    @review = Review.new
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to dashboard_item_path(@item.id), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to dashboard_item_path(@item.id), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to dashboard_items_path, notice: 'Item was successfully destroyed.'
  end

  def category
    @items = Item.send params[:category]
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
      redirect_to dashboard_items_path, notice: 'Invalid Item'
    end

    def invalid_method
      logger.error "Attempt to access invalid method"
      redirect_to dashboard_items_path, notice: 'Invalid method'
    end
end































