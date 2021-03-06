require 'rails_helper'

RSpec.describe "/api/v1/thermostats", type: :request do
  let!(:stat3) {create(:stat3)}
  let!(:stat4) {create(:stat4)}
  let!(:stat5) {create(:stat5)}
  let!(:stat6) {create(:stat6)}

  describe 'GET /api/v1/thermostats' do
    it 'without token returns a bad request' do
      get '/api/v1/thermostats'
      expect(response).to have_http_status(:bad_request)
      expect(response.status).to eq(400) 
    end

    it 'with correct token returns a success' do
      get '/api/v1/thermostats', headers: { :Authorization => "Token #{stat3.household_token}"}
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(Api::V1::Thermostat.count).to eq(4)
    end

    it 'with wrong token returns an Unauthorized' do
      get '/api/v1/thermostats', headers: { :Authorization => "Token f204uc20h2l2iid8fyavonuqv287e3ca"} # wrong token
      expect(response).to have_http_status(:unauthorized)
      expect(response.status).to eq(401)
    end
  end
end
