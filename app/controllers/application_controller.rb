class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      landing_index_path
    else
      dashboard_items_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user
      landing_index_path
    else
      dashboard_items_path
    end
  end

  def set_cart
    if current_user
      begin
        @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.where(user_id: current_user.id, is_ordered: false).last
        if @cart
          session[:cart_id] = @cart.id
        else
          @cart = current_user.carts.create is_ordered: false
          session[:cart_id] = @cart.id
        end
      end
    end
  end

end
