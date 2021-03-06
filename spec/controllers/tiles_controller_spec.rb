require 'rails_helper'

RSpec.describe TilesController, type: :controller do

  describe "GET #show" do
    let(:map) { create(:map) }
    let(:tile) { create(:tile, map: map) }

    it "returns http success" do
      get :show, {code: map.code, id: tile.id}
      expect(response).to have_http_status(:success)
    end

    it "sets tile.revealed to true" do
      get :show, {code: map.code, id: tile.id}
      tile.reload
      expect(tile.revealed).to be true
    end
  end

  describe "#update" do
    let(:map) { create(:map) }
    let(:tile) { create(:tile, map: map) }

    it "patch updates the tiles notes" do
      patch :update, id: tile.id, tile: {notes: 'test'}
      tile.reload
      expect(tile.notes).to eq 'test'
    end
  end

end
