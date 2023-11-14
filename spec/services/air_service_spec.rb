require 'rails_helper'

RSpec.describe AirService, type: :service do
  describe "instance methods", :vcr do
    it "conn" do
      connection = AirService.new.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it "air_quality(params)" do
      params = [2.33, 48.87]

      searched_cords = AirService.new.air_quality(params)

      expect(searched_cords).to be_a Hash
    end
  end
end