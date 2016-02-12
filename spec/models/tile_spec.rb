require 'rails_helper'

describe Tile, type: :model do

  describe '#coords_string' do
    let(:map) { create :map }

    it 'returns the coordinates formatted as a string' do
      tile = map.tiles.first
      expect(tile.coords_string).to eq "0000"
    end
  end
end
