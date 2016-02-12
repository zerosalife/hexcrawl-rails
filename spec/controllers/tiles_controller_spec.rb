require 'rails_helper'

RSpec.describe TilesController, type: :controller do

  describe "GET #show" do
    let(:map) { create(:map) }
    let(:tile) { create(:tile, map: map) }

    it "returns http success" do
      get :show, {code: map.code, id: tile.id}
      expect(response).to have_http_status(:success)
    end
  end

end
