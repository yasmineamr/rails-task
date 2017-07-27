class VideosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_video
  rescue_from NoMethodError, with: :invalid_method
  before_action :set_video, only: [:show]
  before_action :set_item

  # GET /photos
  # GET /photos.json
  def index
    @videos = @item.videos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:url, :item_id)
    end

    def invalid_video
      logger.error "Attempt to access invalid item #{params[:id]}"
      redirect_to landing_index_path, notice: 'Invalid Video'
    end

    def invalid_method
      logger.error "Attempt to access invalid method"
      redirect_to landing_index_path, notice: 'Invalid method'
    end
end
