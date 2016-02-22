class AddCoordinateIndexToTiles < ActiveRecord::Migration
  def change
    add_index :tiles, :x_coord
    add_index :tiles, :y_coord
  end
end
