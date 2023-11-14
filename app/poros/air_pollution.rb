class AirPollution
    attr_reader :id, :aqi, :datetime, :readable_aqi
  
    def initialize(data)
      @id = nil
      @aqi = data["main"]["aqi"]
      @datetime = data["dt"]
      @readable_aqi = calculate_readable_aqi(data["components"])
    end
  
    private
  
    def calculate_readable_aqi(components)

      so2 = components["so2"]
      no2 = components["no2"]
      pm10 = components["pm10"]
      pm25 = components["pm2_5"]
      o3 = components["o3"]
      co = components["co"]
  

      aqi = calculate_aqi(so2, no2, pm10, pm25, o3, co)
  

      case aqi
      when 1
        "Good"
      when 2
        "Fair"
      when 3
        "Moderate"
      when 4
        "Poor"
      when 5
        "Very Poor"
      else
        "Unknown"
      end
    end
  
    def calculate_aqi(so2, no2, pm10, pm25, o3, co)
      total_concentration = so2 + no2 + pm10 + pm25 + o3 + co
      aqi = total_concentration / 10  
  
      aqi.round
    end
  end