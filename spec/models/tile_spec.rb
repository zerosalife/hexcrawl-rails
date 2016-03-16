require 'rails_helper'
require 'tile_data'

describe Tile, type: :model do
  let(:map) { create :map }
  let(:tile) { tile = map.tiles.first }

  describe '#coords_string' do
    it 'returns the coordinates formatted as a string' do
      expect(tile.coords_string).to eq "0000"
    end
  end

  describe '#tile_icon' do
    it 'returns the appropriate icon' do
      expect(tile.tile_icon).to eq TileData::ICON[tile.data['biome']]
    end
  end

  describe '#neighbors' do
    it 'returns the neighbors for the top left corner' do
      neighbors = [map.tiles.find_by(x_coord: 1, y_coord: 0),
                   map.tiles.find_by(x_coord: 0, y_coord: 1),
                   map.tiles.find_by(x_coord: 1, y_coord: 1)]
      expect(tile.neighbors).to match_array neighbors
    end
  end
end
