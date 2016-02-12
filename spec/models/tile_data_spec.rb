require 'spec_helper'
require File.expand_path('app/models/tile_data')

describe TileData do
  describe '#sample_all' do
    subject { TileData.sample_all }
    it 'returns a well-formed hash with correct keys' do
      expect(subject.keys).to eq(TileData::STATIC.keys)
    end

    it 'returns a hash with valid values' do
      subject.keys.each do |key|
        expect(TileData::STATIC[key]).to include(subject[key])
      end
    end
  end
end
