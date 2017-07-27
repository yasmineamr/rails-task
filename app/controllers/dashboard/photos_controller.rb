class Dashboard::PhotosController < DashboardController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_photo
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_item

  def index
    @photos = @item.photos
  end

  def show
  end

  def new
    @photo = @item.photos.new
  end

  def create
    @photo = @item.photos.new(photo_params)

    if @photo.save
      redirect_to dashboard_item_photos_path(item_id: @item.id), notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @photo.destroy
    redirect_to dashboard_item_photos_path(item_id: @item.id)
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_item
      @item = Item.find params[:item_id]
    end

    def photo_params
      params.require(:photo).permit(:file, :item_id)
    end

    def invalid_photo
      logger.error "Attempt to access invalid item #{params[:id]}"
      redirect_to dashboard_items_path, notice: 'Invalid Photo'
    end

end
