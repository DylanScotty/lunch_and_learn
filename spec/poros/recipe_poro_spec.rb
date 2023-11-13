require 'rails_helper'

RSpec.describe RecipePoro do
  describe "#initialize" do
    it "initializes a RecipePoro object" do
      data = {
        "recipe" => {
          "label" => "Delicious Recipe",
          "uri" => "https://example.com/recipe",
          "image" => "recipe_image.jpg"
        }
      }
      country = "United States"

      recipe_poro = RecipePoro.new(data, country)

      expect(recipe_poro).to be_a(RecipePoro)
    end

    it "sets the attributes correctly" do
      data = {
        "recipe" => {
          "label" => "Delicious Recipe",
          "uri" => "https://example.com/recipe",
          "image" => "recipe_image.jpg"
        }
      }
      country = "United States"

      recipe_poro = RecipePoro.new(data, country)

      expect(recipe_poro.id).to be_nil
      expect(recipe_poro.title).to eq("Delicious Recipe")
      expect(recipe_poro.url).to eq("https://example.com/recipe")
      expect(recipe_poro.country).to eq("United States")
      expect(recipe_poro.image).to eq("recipe_image.jpg")
    end
  end
end