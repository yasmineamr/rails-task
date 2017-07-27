class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :item, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.text :text
      t.integer :rate

      t.timestamps
    end
  end
end
