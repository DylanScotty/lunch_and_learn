class RecipeSerializer
    include JSONAPI::Serializer
  
    set_id :id 
    set_type :recipes
  
    attributes :title, :url, :country, :image
end