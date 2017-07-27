class Cart < ApplicationRecord
  enum pay_type: [:check, :credit_card]
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_item(item, is_bundled)
    if is_bundled
      current_item = line_items.find_by(bundled_item_id: item.id)

      if(current_item)
        current_item.quantity += 1
      else
        current_item = line_items.build(bundled_item_id: item.id)
      end
    else
      current_item = line_items.find_by(item_id: item.id)

      if(current_item)
        current_item.quantity += 1
      else
        current_item = line_items.build(item_id: item.id)
      end
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |line_item| line_item.total_price }
  end
end
