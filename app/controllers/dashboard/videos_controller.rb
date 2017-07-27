class Dashboard::VideosController < DashboardController
  before_action :set_video, only: [:show, :destroy]
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

  def new
    @video = @item.videos.new
  end

  def create
    @video = @item.videos.new(video_params)

    if @video.save
      redirect_to dashboard_item_videos_path(item_id: @item.id), notice: 'Video was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @video.destroy
    redirect_to dashboard_item_videos_path(item_id: @item.id)
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
end
