require 'rails_helper'

RSpec.describe 'TouristSites API', type: :request do
  describe 'GET /api/v1/tourist_sites' do
    context 'when a valid country is provided' do
        it "can retrieve all recipes from a certain country", :vcr do
            get '/api/v1/tourist_sites', params: { country: 'France' }
        
            expect(response).to be_successful
        
            json_response = JSON.parse(response.body)
            expect(json_response['data']).to be_an(Array)
        
            expect(json_response['data'][0]["id"]).to eq nil
            expect(json_response['data'][0]["type"]).to eq "tourist_site"
            expect(json_response['data'][0]["attributes"]["name"]).to eq "Fort-de-France"
            expect(json_response['data'][0]["attributes"]["address"]).to eq "Le Chapître, Rue du Chapitre, 23200 Aubusson, France"
            expect(json_response['data'][0]["attributes"]["place_id"]).to be_a String
        end
    end
  end
end