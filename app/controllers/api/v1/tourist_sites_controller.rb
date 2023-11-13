class Api::V1::TouristSitesController < ApplicationController
    def index
        country_name = params[:country]
        tourist_sites_facade = TouristSitesFacade.new
        tourist_sites = tourist_sites_facade.tourist_sites_for_country(country_name)
    
        render json: TouristSiteSerializer.new(tourist_sites)
    end
end