class TouristSiteSerializer
    include JSONAPI::Serializer
  
    set_id :id 
    set_type :tourist_site
  
    attributes :name, :address, :place_id
end