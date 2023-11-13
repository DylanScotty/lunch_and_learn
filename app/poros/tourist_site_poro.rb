class TouristSitePoro
    attr_reader :name, :address, :place_id
  
    def initialize(data)
      @name = data[:name]
      @address = data[:formatted_address]
      @place_id = data[:place_id]
    end
end