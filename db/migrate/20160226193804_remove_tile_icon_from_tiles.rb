class RemoveTileIconFromTiles < ActiveRecord::Migration
  def change
    remove_column :tiles, :tile_icon, :string
  end
end
