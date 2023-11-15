require 'rails_helper'

RSpec.describe RecipeService, type: :service do
  describe "instance methods", :vcr do
    it "conn" do
      connection = RecipeService.new.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it "get_url(link)" do
      fetched_url = RecipeService.new.get_url("api/recipes/v2?q=france")

      expect(fetched_url).to be_a Hash
    end

    it "search_recipes(keyword)" do
      searched_recipes = RecipeService.new.search_recipes("france")

      expect(searched_recipes).to be_a Hash
    end
  end
end