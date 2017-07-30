module HandlingExceptions

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_item
  rescue_from NoMethodError, with: :invalid_method

  def invalid_item
    logger.error "Attempt to access invalid item #{params[:id]}"
    redirect_to dashboard_items_path, notice: 'Invalid Item'
  end

  def invalid_method
    logger.error "Attempt to access invalid method"
    redirect_to dashboard_items_path, notice: 'Invalid method'
  end

end
