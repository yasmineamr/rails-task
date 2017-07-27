class LineItem < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :cart
  belongs_to :bundled_item, optional: true

  validate :must_have_one_item

  def total_price
  	if item
    	item.price * quantity
    else
    	bundled_item.discounted_price * quantity
    end
  end

  def must_have_one_item
    item || bundled_item
  end

end
