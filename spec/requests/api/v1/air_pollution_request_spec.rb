require "rails_helper"

RSpec.describe "Air Pollution Request" do
  describe "Air Pollution by cords" do
    it "returns Air Pollution based on latitude-longitude the capital city that is provided by the user, happy path" do
      VCR.use_cassette("france_country_sites") do
        get "/api/v1/air_quality?country=France"

        expect(response).to be_successful

        air_pollution = JSON.parse(response.body, symbolize_names: true)

        expect(air_pollution).to have_key(:data)
        expect(air_pollution[:data]).to be_an(Array)

        location = air_pollution[:data].first

        expect(location).to have_key(:id)
        expect(location[:id]).to eq(nil)

        expect(location).to have_key(:type)
        expect(location[:type]).to be_a(String)
        expect(location[:type]).to eq("air_quality")

        expect(location).to have_key(:attributes)
        expect(location[:attributes]).to be_a(Hash)

        expect(location[:attributes]).to have_key(:aqi)
        expect(location[:attributes][:aqi]).to be_a(Integer)

        expect(location[:attributes]).to have_key(:datetime)
        expect(location[:attributes][:datetime]).to be_a(Integer)

        expect(location[:attributes]).to have_key(:readable_aqi)
        expect(location[:attributes][:readable_aqi]).to be_a(String)
      end
    end
  end
end