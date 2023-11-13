class CountryFacade
    def random_country
      countries = fetch_countries
      country = countries.sample
  
      country["name"]["common"]
    end
  
    def fetch_countries
      all_countries = CountryService.new.find_all
    end
  
    def find_country(country_name)
      country = CountryService.new.search_country(country_name.downcase)
      if country[0] == nil
        nil
      else
        country[0]["name"]["common"]
      end
    end

    def capital_coords_for_country(country_name)
        country_service = CountryService.new
        country_info = country_service.capital_coords(country_name)
    
        return nil unless country_info
    
        country_info.map(&:to_f)
    end

end