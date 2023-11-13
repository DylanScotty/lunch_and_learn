class PlacesService
    def conn
      Faraday.new(url: "https://api.geoapify.com/") do |faraday|
        faraday.params["apiKey"] = Rails.application.credentials.geoapify[:apiKey]
      end
    end
  
    def get_url(link)
      response = conn.get(link)
      JSON.parse(response.body, symbolize_names: true)
    end
  
    def search_tourist_sites_near_location(category, coords)
        params = {
          categories: category,
          bias: "proximity:#{coords[1]},#{coords[0]}",
          limit: 20,
          apiKey: Rails.application.credentials.geoapify[:apiKey]
        }
      
        get_url("/v2/places", params)
    end
end