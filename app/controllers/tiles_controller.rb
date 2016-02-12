class TilesController < ApplicationController
  before_filter :set_tile

  def reroll
    @tile.reroll(params[:node])
    @tile.save
    redirect_to @tile
  end

  private
  def set_tile
    tile_id = params[:id]
    @tile = Tile.find_by(id: tile_id)
  end
end
