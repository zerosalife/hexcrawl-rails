require 'rails_helper'

RSpec.describe Map, type: :model do
  let(:map1) { create(:map) }
  let(:map2) { create(:map) }

  it 'has unique code' do
    expect(map1.code).not_to eq(map2.code)
  end

  it 'is square with a side length of MAP_DIM_SIZE tiles' do
    expect(map1.tiles.count).to eq Map::MAP_DIM_SIZE * Map::MAP_DIM_SIZE
  end

  describe '#tile_at' do
    it 'returns nil when there is no tile' do
      expect(map1.tile_at(150000, 0)).to be_nil
    end

    it 'returns the tile when there is a tile' do
      tile = map1.tiles.first
      expect(map1.tile_at(tile.x_coord, tile.y_coord)).to eq tile
    end
  end
end
