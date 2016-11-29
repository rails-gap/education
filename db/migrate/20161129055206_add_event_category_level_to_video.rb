class AddEventCategoryLevelToVideo < ActiveRecord::Migration
  def change
    add_reference :videos, :category, foreign_key: true
    add_reference :videos, :event, foreign_key: true
    add_column :videos, :level, :string
  end
end
