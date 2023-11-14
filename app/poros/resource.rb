class Resource
    attr_reader :id, :country, :video, :images
  
    def initialize(video_data, images_data, country)
      @id = nil
      @country = country
      @video = parse_video(video_data)
      @images = parse_images(images_data)
    end
  
    def parse_video(video)
      if video == nil
        {}
      else
        { 
          title: video["snippet"]["title"], 
          youtube_video_id: video["id"]["videoId"]
        }
      end
    end
  
    def parse_images(images)
      images.map do |image|
        { 
          alt_tag: image[:alt_description],
          url: image[:urls][:raw]
        }
      end
    end
end