class PhotosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_photo
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_photo, only: [:show]
  before_action :set_item

  def index
    @photos = @item.photos
  end

  def show
  end


  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def photo_params
      params.require(:photo).permit(:file, :item_id)
    end

    def invalid_photo
      logger.error "Attempt to access invalid item #{params[:id]}"
      redirect_to landing_index_path, notice: 'Invalid Photo'
    end

    def invalid_method
      logger.error "Attempt to access invalid method"
      redirect_to landing_index_path, notice: 'Invalid method'
    end
end
