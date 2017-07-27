class AddAddressToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :address, :text
  end
end
