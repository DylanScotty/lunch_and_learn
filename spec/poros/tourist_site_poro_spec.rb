require 'rails_helper'

RSpec.describe TouristSitePoro do
  let(:tourist_site_data) do
    {
      name: 'Le Chapître',
      formatted_address: 'Le Chapître, Rue du Chapitre, 23200 Aubusson, France',
      place_id: '1234'
    }
  end

  subject { described_class.new(tourist_site_data) }

  describe '#initialize' do
    it 'creates a TouristSitePoro object with the correct attributes' do
      expect(subject.name).to eq('Le Chapître')
      expect(subject.address).to eq('Le Chapître, Rue du Chapitre, 23200 Aubusson, France')
      expect(subject.place_id).to eq('1234')
    end
  end
end