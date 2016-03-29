class AddFilledToTiles < ActiveRecord::Migration
  def change
    add_column :tiles, :filled, :boolean
  end
end
