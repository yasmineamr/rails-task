class Dashboard::BundledItemsController < DashboardController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_item
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_bundled_item, only: [:show, :edit, :update, :destroy]

  def index
    @bundled_items = BundledItem.all
  end

  def show
    @items = @bundled_item.set_items
  end

  def new
    @bundled_item = BundledItem.new
    @items = Item.all
    @items.each do |item|
      @bundled_item.set_items.build(item: item)
    end
  end

  def edit
    @items = Item.all
    item_ids = @bundled_item.set_items.map(&:item_id)

    @items.each do |item|
      if !(item_ids.include? item.id)
        @bundled_item.set_items.build(item: item)
      end
    end
  end

  def create
    @bundled_item = BundledItem.new(bundled_item_params)
    item_ids = @bundled_item.set_items.map(&:item_id)

    if @bundled_item.save
      redirect_to dashboard_bundled_items_path
    else
      @items = Item.all
      @items.each do |item|
        if !(item_ids.include? item.id)
          @bundled_item.set_items.build(item: item)
        end
      end
      render :new
    end
  end

  def update
    item_ids = @bundled_item.set_items.map(&:item_id)    
    if @bundled_item.update(bundled_item_params)
      redirect_to dashboard_bundled_item_path(@bundled_item), notice: 'Bundled item was successfully updated.' 
    else
      @items = Item.all
      @items.each do |item|
        if !(item_ids.include? item.id)
          @bundled_item.set_items.build(item: item)
        end
      end
      render :edit
    end
  end

  def destroy
    @bundled_item.destroy
    redirect_to dashboard_bundled_items_path
  end

  private
    def set_bundled_item
      @bundled_item = BundledItem.find(params[:id])
    end

    def bundled_item_params
      params.require(:bundled_item).permit(:discounted_price, :title, set_items_attributes: [:id, :item_id, :quantity, :_destroy])
    end

    def invalid_item
      logger.error "Attempt to access invalid item #{params[:id]}"
      redirect_to dashboard_items_path, notice: 'Invalid Bundled Item'
    end

    def invalid_method
      logger.error "Attempt to access invalid method"
      redirect_to dashboard_items_path, notice: 'Invalid Method'
    end
end
