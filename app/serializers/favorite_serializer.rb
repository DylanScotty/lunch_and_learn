class FavoriteSerializer
    include JSONAPI::Serializer
  
    set_id :id
    set_type :favorite
  
    attributes :recipe_title, :recipe_link, :country, :created_at
end