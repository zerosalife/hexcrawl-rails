class TilesController < ApplicationController
  before_filter :set_tile

  def reroll
    @tile.reroll(params[:node])
    @tile.save
    redirect_to @tile
  end

  def update
    @tile.update! tile_params
    redirect_to tiles_path(@tile.map.code, @tile)
  end

  private
  def tile_params
    params.require(:tile).permit(:notes)
  end

  def set_tile
    tile_id = params[:id]
    @tile = Tile.find_by(id: tile_id)
    @tile.revealed = true
    @tile.save
  end
end
