class CreateSetItems < ActiveRecord::Migration[5.1]
  def change
    create_table :set_items do |t|
      t.belongs_to :bundled_item, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
