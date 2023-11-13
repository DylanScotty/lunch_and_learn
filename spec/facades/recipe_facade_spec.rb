require 'rails_helper'
require_relative '../../app/facades/recipe_facade'

RSpec.describe RecipeFacade do
  let(:recipe_facade) { RecipeFacade.new }

  describe '#search_recipes' do
    it 'returns an array of RecipePoro objects' do
      country = 'Thailand'


      allow_any_instance_of(RecipeService).to receive(:search_recipes).with(country).and_return({
        "hits" => [
          { "recipe" => { "label" => "Recipe1", "uri" => "uri1", "image" => "image1" } },
          { "recipe" => { "label" => "Recipe2", "uri" => "uri2", "image" => "image2" } }
        ]
      })

      recipes = recipe_facade.search_recipes(country)

      expect(recipes).to be_an(Array)
      expect(recipes.length).to eq(2)

      expect(recipes[0]).to be_a(RecipePoro)
      expect(recipes[0].title).to eq("Recipe1")
      expect(recipes[0].url).to eq("uri1")
      expect(recipes[0].country).to eq(country)
      expect(recipes[0].image).to eq("image1")

      expect(recipes[1]).to be_a(RecipePoro)
      expect(recipes[1].title).to eq("Recipe2")
      expect(recipes[1].url).to eq("uri2")
      expect(recipes[1].country).to eq(country)
      expect(recipes[1].image).to eq("image2")
    end
  end
end






