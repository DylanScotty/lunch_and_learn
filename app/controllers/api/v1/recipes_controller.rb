class Api::V1::RecipesController < ApplicationController
    def index
      if params[:country] == "random"
        random_country = CountryFacade.new.random_country
        recipes = RecipeFacade.new.search_recipes(random_country) 
      else
        country = CountryFacade.new.find_country(params[:country])
        recipes = RecipeFacade.new.search_recipes(country)
      end
  
      render json: RecipeSerializer.new(recipes)
    end
end