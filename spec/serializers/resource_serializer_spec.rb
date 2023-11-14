require 'rails_helper'

RSpec.describe 'Resource Serializer' do
  it "returns the JSON resource object within the serializer's format" do
    country = 'Learning Land'
    video_data = {
      'snippet' => { 'title' => 'History of Learning' },
      'id' => { 'videoId' => 'abc123' }
    }
    images_data = [
      {
        alt_description: 'Beautiful Learning Image',
        urls: { 
          raw: 'http://example.com/learning_image.jpg' 
        }
      },
      {
        alt_description: 'Another Learning Image',
        urls: { 
          raw: 'http://example.com/another_learning_image.jpg' 
        }
      }
    ]

    resource = Resource.new(video_data, images_data, country)

    serialized_resource = ResourceSerializer.new(resource).serializable_hash

    expected_format = {
      data: {
        id: nil,
        type: "learning_resources",
        attributes: {
          country: 'Learning Land',
          video: {
            title: 'History of Learning',
            youtube_video_id: 'abc123'
          },
          images: [
            {
              alt_tag: 'Beautiful Learning Image',
              url: 'http://example.com/learning_image.jpg'
            },
            {
              alt_tag: 'Another Learning Image',
              url: 'http://example.com/another_learning_image.jpg'
            }
          ]
        }
      }
    }
  end
end