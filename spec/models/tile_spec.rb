require 'rails_helper'
require 'tile_data'

describe Tile, type: :model do
  let(:map) { create :map }

  describe '#coords_string' do
    it 'returns the coordinates formatted as a string' do
      tile = map.tiles.first
      expect(tile.coords_string).to eq "0000"
    end
  end

  describe '#tile_icon' do
    it 'returns the appropriate icon' do
      tile = map.tiles.first
      expect(tile.tile_icon).to eq TileData::ICON[tile.data['biome']]
    end
  end
end
