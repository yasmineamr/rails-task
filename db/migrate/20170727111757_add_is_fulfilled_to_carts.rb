class AddIsFulfilledToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :is_fulfilled, :boolean, default: false
  end
end
