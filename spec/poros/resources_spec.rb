require 'rails_helper'

RSpec.describe Resource do
  let(:video_data) do
    {
      'snippet' => { 'title' => 'Bob Ross' },
      'id' => { 'videoId' => '123' }
    }
  end

  let(:images_data) do
    [
      { alt_description: 'Alt Tag 1', urls: { raw: 'image_url_1.jpg' } },
      { alt_description: 'Alt Tag 2', urls: { raw: 'image_url_2.jpg' } }
    ]
  end

  let(:country) { 'china' }

  let(:resource) { Resource.new(video_data, images_data, country) }

  it 'has the correct attributes' do
    expect(resource.id).to be_nil
    expect(resource.country).to eq('china')

    expect(resource.video).to eq(
      title: 'Bob Ross',
      youtube_video_id: '123'
    )

    expect(resource.images).to match_array([
      { alt_tag: 'Alt Tag 1', url: 'image_url_1.jpg' },
      { alt_tag: 'Alt Tag 2', url: 'image_url_2.jpg' }
    ])
  end
end