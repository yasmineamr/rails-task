class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.belongs_to :item, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
