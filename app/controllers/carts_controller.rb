class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :authorize
  before_action :set_cart

  #when checkout
  def update
    if params[:cart][:address].blank?
      render :checkout, notice: "Enter an address"
    elsif @cart.update(cart_params)
      session[:cart_id] = nil
      OrderMailer.received(@cart, current_user).deliver_later
      redirect_to landing_index_path, notice: 'Thank you for your order.'
    else
      render :checkout
    end
  end

  #when empty cart
  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to landing_index_path, notice: 'Your cart is currently empty.'
  end

  def checkout
    if @cart.line_items.empty?
      redirect_to landing_index_path, notice: 'Your cart is empty!'
    end
  end

  private
    def cart_params
      params.require(:cart).permit(:address, :pay_type, :is_ordered)

    end
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to landing_index_path, notice: 'Invalid cart'
    end

    def authorize
      if !current_user
        redirect_to landing_index_path, notice: 'Please login'
      end
    end
end
