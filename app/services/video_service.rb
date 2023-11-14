class VideoService

    def conn
      Faraday.new(
        url: "https://www.googleapis.com/", 
        params: {
          key: Rails.application.credentials.youtube[:key],
          part: "snippet",
          channelId: "UCluQ5yInbeAkkeCndNnUhpw"
        }
      )
    end
  
    def get_url(link)
      response = conn.get(link)
      JSON.parse(response.body, symbolize_name: true)
    end
  
    def search_videos(keyword)
      get_url("youtube/v3/search?q=#{keyword}")
    end
end