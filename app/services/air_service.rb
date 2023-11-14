class AirService
    def conn
        Faraday.new(
            url: "http://api.openweathermap.org",
            params: {
                appid: Rails.application.credentials.air[:appid]
            }
        )
    end

    def get_url(link)
        response = conn.get(link)
        JSON.parse(response.body, symbolize_name: true)
    end

    def air_quality(cords)
        lat = cords[0]
        long = cords[-1]

        get_url("/data/2.5/air_pollution?lat=#{lat}&lon=#{long}")
    end
end
