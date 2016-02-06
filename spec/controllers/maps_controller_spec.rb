require 'rails_helper'

RSpec.describe MapsController, type: :controller do

  describe "GET #show" do
    let(:map) { create :map }
    let(:invalid_code) { "****" }

    it "returns http success with a valid code" do
      get :show, code: map.code
      expect(response).to have_http_status(:success)
    end

    it "redirects to main index with invalid code" do
      get :show, code: invalid_code
      expect(response).to redirect_to(root_url)
    end
  end

end
