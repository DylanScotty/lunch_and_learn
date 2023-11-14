require 'rails_helper'

RSpec.describe VideoService, type: :service do
  describe "instance methods", :vcr do
    it "conn" do
      connection = VideoService.new.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it "get_url(link)" do
      fetched_url = VideoService.new.get_url("youtube/v3/search?q=history")

      expect(fetched_url).to be_a Hash
    end

    it "search_videos(keyword)" do
      searched_videos = VideoService.new.search_videos("history")

      expect(searched_videos).to be_a Hash
    end
  end
end