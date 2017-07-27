class LandingController < ApplicationController
  def index
    @featured_items = Item.where(is_featured: true)
    @bundled_items = BundledItem.all
  end
end
