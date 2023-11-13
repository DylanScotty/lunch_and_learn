class TouristSitesFacade
    def tourist_sites_for_country(country_name)
      country_facade = CountryFacade.new
      capital_coords = country_facade.capital_coords_for_country(country_name)
  
      return nil unless capital_coords
  
      places_service = PlacesService.new
      places_service.search_tourist_sites_near_location("tourism.sights", capital_coords)
    end
end