class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :item_type
      t.boolean :is_featured

      t.timestamps
    end
  end
end
