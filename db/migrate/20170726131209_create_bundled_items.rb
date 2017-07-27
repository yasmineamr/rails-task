class CreateBundledItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bundled_items do |t|
      t.decimal :discounted_price
      t.string :title

      t.timestamps
    end
  end
end
