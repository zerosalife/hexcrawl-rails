class AddXCoordToTile < ActiveRecord::Migration
  def change
    add_column :tiles, :x_coord, :integer
  end
end
