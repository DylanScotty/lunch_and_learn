class RecipeFacade
    def search_recipes(country)
      response = RecipeService.new.search_recipes(country)
  
      response["hits"].map do |recipe_data|
        RecipePoro.new(recipe_data, country)
      end
    end
end