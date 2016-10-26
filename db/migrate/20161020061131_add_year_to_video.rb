class AddYearToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :year, :string
  end
end
