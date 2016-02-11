class TilesController < ApplicationController
  def show
    tile_id = params[:id]
    @tile = Tile.find_by(id: tile_id)
  end
end
