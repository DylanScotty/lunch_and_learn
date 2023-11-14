require 'rails_helper'

RSpec.describe AirFacade, type: :facade do
  describe "instance methods" do
    it "air_quality(cords)", :vcr do
      cords = [2.33, 48.87]

      quality = AirFacade.new.air_quality(cords)

      expect(quality).to be_an(Array)
    end
  end
end