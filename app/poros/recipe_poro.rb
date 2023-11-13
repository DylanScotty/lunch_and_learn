class RecipePoro
    attr_reader :id, :title, :url, :country, :image
  
    def initialize(data, country)
      @id = nil
      @title = data["recipe"]["label"]
      @url = data["recipe"]["uri"]
      @country = country
      @image = data["recipe"]["image"]
    end
end