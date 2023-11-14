class AirFacade
    def air_quality(cords)
      json =  AirService.new.air_quality(cords)
      quality = json["list"].map do |data|
        AirPollution.new(data)
      end
    end
end