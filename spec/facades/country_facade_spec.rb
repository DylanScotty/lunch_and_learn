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

  describe '#capital_coords_for_country' do
    context 'when the country exists' do
      it 'returns the capital coordinates as an array of floats' do
        allow_any_instance_of(CountryService).to receive(:capital_coords).and_return([14.6, -61.08])
        expect(country_facade.capital_coords_for_country('ExistingCountry')).to eq([14.6, -61.08])
      end
    end

    context 'when the country does not exist' do
      it 'returns nil' do
        allow_any_instance_of(CountryService).to receive(:capital_coords).and_return(nil)
        expect(country_facade.capital_coords_for_country('NonExistentCountry')).to be_nil
      end
    end
  end
end