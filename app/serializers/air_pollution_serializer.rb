class AirPollutionSerializer
    include JSONAPI::Serializer
    set_type :air_quality
  
    attributes :aqi, :datetime, :readable_aqi
end