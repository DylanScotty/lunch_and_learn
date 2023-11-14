require 'rails_helper'

RSpec.describe AirPollution, type: :poro do
  describe 'initialize' do
    it 'creates a new AirPollution object' do
      data = {
        "main" => { "aqi" => 1 },
        "components" => {
          "co" => 307.08,
          "no" => 0,
          "no2" => 0.07,
          "o3" => 21.64,
          "so2" => 0.01,
          "pm2_5" => 0.5,
          "pm10" => 0.59,
          "nh3" => 0
        },
        "dt" => 1699983627
      }

      air_pollution = AirPollution.new(data)

      expect(air_pollution.id).to be_nil
      expect(air_pollution.aqi).to eq(1)
      expect(air_pollution.datetime).to eq(1699983627)
      expect(air_pollution.readable_aqi).to eq('Unknown') 
    end
  end
end






