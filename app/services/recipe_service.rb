class RecipeService

    def conn
      Faraday.new(
        url: "https://api.edamam.com/", 
        params: {
          app_id: Rails.application.credentials.edamam[:app_id],
          app_key: Rails.application.credentials.edamam[:app_key],
          type: "public"
        }
      )
    end
  
    def get_url(link)
      response = conn.get(link)
      JSON.parse(response.body, symbolize_name: true)
    end
  
    def search_recipes(keyword)
      get_url("api/recipes/v2?q=#{keyword}")
    end
end