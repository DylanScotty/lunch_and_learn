class CountryService
    def conn
      Faraday.new(url: "https://restcountries.com")
    end
  
    def get_url(link)
      response = conn.get(link)
      JSON.parse(response.body, symbolize_name: true)
    end
  
    def find_all
      get_url("/v3.1/all")
    end
  
    def search_country(country_name)
      get_url("/v3.1/name/#{country_name}")
    end

    def capital_coords(country_name)
      get_url("/v3.1/capital/#{country_name}")
    end
end