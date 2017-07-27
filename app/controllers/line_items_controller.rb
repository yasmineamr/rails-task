class LineItemsController < ApplicationController

  def create
    is_bundled = false
    if params[:item_id]
      item = Item.find(params[:item_id])
    else
      is_bundled = true
      item = BundledItem.find(params[:bundled_item_id])
    end
    @line_item = @cart.add_item(item, is_bundled)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to landing_index_path }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  private
    def line_item_params
      params.require(:line_item).permit(:item_id, :bundled_item_id)
    end
end
