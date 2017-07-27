class AdminsController < ApplicationController

  def index
    puts "============"
    if current_admin
      @user = current_admin
    else
      @user = "yasmine"
    end
  end

end
