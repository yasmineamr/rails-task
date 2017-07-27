module CurrentCart

  private
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
