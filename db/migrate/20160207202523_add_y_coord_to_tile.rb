class AddYCoordToTile < ActiveRecord::Migration
  def change
    add_column :tiles, :y_coord, :integer
  end
end
