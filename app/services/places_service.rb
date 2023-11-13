class PlacesService
    def conn
      Faraday.new(url: "https://api.geoapify.com/") do |faraday|
        faraday.params["apiKey"] = Rails.application.credentials.geoapify[:api_key]
      end
    end
  
    def get_url(link)
      response = conn.get(link)
      JSON.parse(response.body, symbolize_names: true)
    end
  
    def search_tourist(keyword)
      get_url("/v2/places?#{keyword}")
    end
end