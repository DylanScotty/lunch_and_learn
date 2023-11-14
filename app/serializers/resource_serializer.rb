class ResourceSerializer
    include JSONAPI::Serializer
  
    set_id :id 
    set_type :learning_resources
    attributes :country, :video, :images
  
    attribute :video do |object|
      object.video
    end
  
    attribute :images do |object|
      object.images
    end
end