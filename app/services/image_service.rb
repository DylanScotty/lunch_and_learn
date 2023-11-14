class ImageService

    def conn
      Faraday.new(
        url: "https://api.unsplash.com/", 
        headers: {
          Authorization: "Client-ID #{Rails.application.credentials.unsplash[:access_key]}"
        }
      )
    end
  
    def get_url(link)
      response = conn.get(link)
      JSON.parse(response.body, symbolize_names: true)
    end
  
    def search_images(keyword)
      get_url("search/photos?query=#{keyword}")
    end
end