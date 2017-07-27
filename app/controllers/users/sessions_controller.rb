class Users::SessionsController < ::Devise::SessionsController

  def new
   	redirect_to landing_index_path, notice: "You must sign in through facebook"
  end
end
