class Dashboard::OrdersController < DashboardController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_order, only: [:show, :fulfill, :unfulfill]

  def index
    @orders = Cart.where(is_ordered: true).order(id: :desc)
  end

  def show
    @user = User.find(@order.user_id)
  end

  def fulfill
    @order.update(is_fulfilled: true)
    redirect_to dashboard_orders_path
  end

  def unfulfill
    @order.update(is_fulfilled: false)
    redirect_to dashboard_orders_path
  end

  private
  def set_order
    @order = Cart.find(params[:id])
  end

  def invalid_order
    logger.error "Attempt to access invalid item #{params[:id]}"
    redirect_to dashboard_items_path, notice: 'Invalid Order'
  end

  def invalid_method
    logger.error "Attempt to access invalid method"
    redirect_to dashboard_items_path, notice: 'Invalid method'
  end
end
