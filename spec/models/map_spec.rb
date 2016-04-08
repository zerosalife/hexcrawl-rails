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

  it 'has DISTINCT_REGIONS or fewer distinct regions' do
    map1.reload
    expect(map1.tiles.map { |n| n.data['biome'] }.uniq.count).to be <= Map::DISTINCT_REGIONS
    # Test both generated maps to develop some statistical certainty
    map2.reload
    expect(map2.tiles.map { |n| n.data['biome'] }.uniq.count).to be <= Map::DISTINCT_REGIONS
  end
end
