require 'rails_helper'

RSpec.describe "/api/v1/readings", type: :request do
  let!(:stat1) {create(:stat1)}

  describe 'GET /api/v1/readings/:id' do
    let!(:reading) {create(:reading)}
    it 'without token returns a bad request' do
      get '/api/v1/readings/1'
      expect(response).to have_http_status(:bad_request)
      expect(response.status).to eq(400) 
    end

    it 'with correct token returns a success' do
      get '/api/v1/readings/1', headers: { :Authorization => "Token #{stat1.household_token}"}
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'with correct token and no reading returns a no content' do
      get '/api/v1/readings/123', headers: { :Authorization => "Token #{stat1.household_token}"}
      expect(response).to have_http_status(:not_found)
      expect(response.status).to eq(404)
    end

    it 'with wrong token returns an Unauthorized' do
      get '/api/v1/readings/1', headers: { :Authorization => "Token 80ee56rv8p7t46j5pw359ohjqy6e1c5x"}
      expect(response).to have_http_status(:unauthorized)
      expect(response.status).to eq(401)
    end
  end

  describe 'POST /api/v1/readings' do
    it 'without token returns a bad request' do
      post '/api/v1/readings'
      expect(response).to have_http_status(:bad_request)
      expect(response.status).to eq(400) 
    end

    it 'with wrong token returns an Unauthorized' do
      post '/api/v1/readings', headers: { :Authorization => "Token 80ee56rv8p7t46j5pw359ohjqy6e1c5x"}
      expect(response).to have_http_status(:unauthorized)
      expect(response.status).to eq(401)
    end

    it 'should create reading' do
      post '/api/v1/readings', headers: { :Authorization => "Token #{stat1.household_token}"}, params: { :reading => { temperature: 1.1, humidity: 10.7, battery_charge: 12.2 } }
      expect(response).to have_http_status(:created)
      expect(response.status).to eq(201)
    end

  end
end
