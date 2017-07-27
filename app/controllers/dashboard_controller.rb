class DashboardController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  layout 'dashboard'

  def after_sign_out_path_for(resource_or_scope)
    new_dashboard_admin_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_items_path
  end

  protected
  def authorize
    if !current_dashboard_admin
      redirect_to new_dashboard_admin_session_path
  	end
  end
end
