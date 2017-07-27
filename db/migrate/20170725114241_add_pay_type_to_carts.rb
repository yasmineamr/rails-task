class AddPayTypeToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :pay_type, :integer
  end
end
