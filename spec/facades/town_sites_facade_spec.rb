require 'rails_helper'
require_relative '../../app/facades/tourist_sites_facade'

RSpec.describe TouristSitesFacade do
  let(:tourist_sites_facade) { TouristSitesFacade.new }

  describe '#tourist_sites_for_country' do
    context 'when a valid country is provided' do
      it 'returns a collection of tourist sites' do
        allow_any_instance_of(CountryFacade).to receive(:capital_coords_for_country).and_return([12.34, 56.78])
        allow_any_instance_of(PlacesService).to receive(:search_tourist_sites_near_location).and_return([
          { "name" => "Tourist Site 1", "formatted_address" => "Address 1", "place_id" => "1234" },
          { "name" => "Tourist Site 2", "formatted_address" => "Address 2", "place_id" => "5678" }
        ])

        result = tourist_sites_facade.tourist_sites_for_country('ValidCountry')

        expect(result).to be_an(Array)
        expect(result.length).to eq(2)
        expect(result[0]['name']).to eq('Tourist Site 1')
        expect(result[1]['formatted_address']).to eq('Address 2')
      end
    end

    context 'when an invalid country is provided' do
      it 'returns nil' do
        allow_any_instance_of(CountryFacade).to receive(:capital_coords_for_country).and_return(nil)

        result = tourist_sites_facade.tourist_sites_for_country('InvalidCountry')

        expect(result).to be_nil
      end
    end
  end
end