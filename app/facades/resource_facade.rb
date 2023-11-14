class ResourceFacade

    def find_resources(country)
      json_video = VideoService.new.search_videos(country)
      json_images = ImageService.new.search_images(country)
  
      Resource.new(json_video["items"][0], json_images[:results].first(10), country)
    end
end