require 'rails_helper'
require_relative '../../app/facades/country_facade'

RSpec.describe CountryFacade do
  let(:country_facade) { CountryFacade.new }
  
  describe '#random_country' do
    it 'returns a random country name' do
      allow(country_facade).to receive(:fetch_countries).and_return([{ "name" => { "common" => "Country1" } }])
      expect(country_facade.random_country).to eq("Country1")
    end
  end

  describe '#find_country' do
    context 'when the country exists' do
      it 'returns the country name' do
        allow_any_instance_of(CountryService).to receive(:search_country).and_return([{ "name" => { "common" => "FoundCountry" } }])
        expect(country_facade.find_country('FoundCountry')).to eq('FoundCountry')
      end
    end

    context 'when the country does not exist' do
      it 'returns nil' do
        allow_any_instance_of(CountryService).to receive(:search_country).and_return([])
        expect(country_facade.find_country('NonExistentCountry')).to be_nil
      end
    end
  end
end

describe "find_cords_country(country_name)", :vcr do
    it "Happy Path" do
      country_facade = CountryFacade.new
      country_name = 'France'

      cords = country_facade.find_cords_country(country_name)

      expect(cords).to be_a Array
    end
end