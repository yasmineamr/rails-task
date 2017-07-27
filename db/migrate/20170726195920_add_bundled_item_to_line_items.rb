class AddBundledItemToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :line_items, :bundled_item, foreign_key: true
  end
end
