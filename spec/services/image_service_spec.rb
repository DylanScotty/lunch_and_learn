require 'rails_helper'

RSpec.describe ImageService, type: :service do
  describe "instance methods", :vcr do
    it "conn" do
      connection = ImageService.new.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it "get_url(link)" do
      fetched_url = ImageService.new.get_url("search/photos?query=nature")

      expect(fetched_url).to be_a Hash
    end

    it "search_images(keyword)" do
      searched_images = ImageService.new.search_images("nature")

      expect(searched_images).to be_a Hash
      expect(searched_images[:results]).to be_a Array
    end
  end
end