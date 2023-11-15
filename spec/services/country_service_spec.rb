require 'rails_helper'

RSpec.describe CountryService, type: :service do
  describe "instance methods", :vcr do
    it "conn" do
      connection = CountryService.new.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it "get_url(link)" do
      fetched_url = CountryService.new.get_url("/v3.1/all")

      expect(fetched_url).to be_a Array
    end

    it "find_all" do
      all_countries = CountryService.new.find_all

      expect(all_countries).to be_a Array
    end

    it "search_country(country_name)" do
      searched_country = CountryService.new.search_country("Mexico")

      expect(searched_country).to be_a Array
    end
  end
end