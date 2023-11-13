require 'rails_helper'

RSpec.describe 'TouristSites API', type: :request do
  describe 'GET /api/v1/tourist_sites' do
    context 'when a valid country is provided' do
      it 'returns a collection of tourist sites' do
        VCR.use_cassette('tourist_sites/happy_path', record: :once) do
          get '/api/v1/tourist_sites', params: { country: 'France' }
        end

        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq('application/json; charset=utf-8')

        json_response = JSON.parse(response.body)
        expect(json_response).to have_key('data')
        expect(json_response['data']).to be_an(Hash)
        require 'pry'; binding.pry
        expect(json_response['data'][0]).to have_key('id')
        expect(json_response['data'][0]).to have_key('type')
        expect(json_response['data'][0]['type']).to eq('tourist_site')
        expect(json_response['data'][0]).to have_key('attributes')
        expect(json_response['data'][0]['attributes']).to have_key('name')
        expect(json_response['data'][0]['attributes']).to have_key('address')
        expect(json_response['data'][0]['attributes']).to have_key('place_id')
      end
    end
  end
end