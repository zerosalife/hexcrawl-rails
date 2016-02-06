require 'rails_helper'

RSpec.describe MapsController, type: :controller do

  describe "GET #show" do
    let(:map) { create :map }

    it "returns http success with a valid code" do
      get :show, code: map.code
      expect(response).to have_http_status(:success)
    end
  end

end
