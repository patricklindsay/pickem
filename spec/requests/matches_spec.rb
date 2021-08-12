require 'rails_helper'

RSpec.describe "Matches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/matches"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    # TODO: Create match object using FactoryBot
    let(:match) { double(id: 1) }

    xit "returns http success" do
      get "/matches/#{match.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
