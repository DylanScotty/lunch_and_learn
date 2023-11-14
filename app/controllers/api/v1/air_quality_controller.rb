class Api::V1::AirQualityController< ApplicationController
    def index
        cords = CountryFacade.new.find_cords_country(params[:country])

        air_pollution = AirFacade.new.air_quality(cords)

        render json: AirPollutionSerializer.new(air_pollution)
    end
end