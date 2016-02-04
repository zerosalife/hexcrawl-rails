require 'rails_helper'

RSpec.describe Map, type: :model do
  let(:map1) { create(:map) }
  let(:map2) { create(:map) }

  it 'has unique code' do
    expect(map1.code).not_to eq(map2.code)
  end
end
