class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :link
      t.text :description
      t.string :presenter
      t.boolean :active, default: true
      t.text :tags

      t.timestamps null: false
    end
  end
end
