require 'rails_helper'

RSpec.describe CountryFacade, type: :facade do
  describe "instance methods" do
    it "random_country", :vcr do
      country_facade = CountryFacade.new

      random_country = country_facade.random_country

      expect(random_country).to be_a String
    end

    it "fetch_countries", :vcr do
      country_facade = CountryFacade.new

      all_countries = country_facade.fetch_countries

      expect(all_countries).to be_an Array
      expect(all_countries).not_to be_empty
    end

    it "find_country(country_name)", :vcr do
      country_facade = CountryFacade.new
      country_name = 'France' 

      found_country = country_facade.find_country(country_name)

      expect(found_country).to eq country_name
    end

    it "capital_coords_for_country", :vcr do
      country_facade = CountryFacade.new
      country_name = 'France'

      coords = country_facade.capital_coords_for_country(country_name)

    end
  end
end