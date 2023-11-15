require 'rails_helper'

RSpec.describe ResourceFacade do
  describe '#find_resources' do
    let(:country) { 'india' }

    it 'returns a Resource object with video and images' do
      video_service_double = instance_double('VideoService', search_videos: { 'items' => [{ 'snippet' => { 'title' => 'Sample Video Title' }, 'id' => { 'videoId' => 'sample_video_id' } }] })
      image_service_double = instance_double('ImageService', search_images: { results: [{ alt_description: 'Alt Tag 1', urls: { raw: 'image_url_1.jpg' } }] })

      allow(VideoService).to receive(:new).and_return(video_service_double)
      allow(ImageService).to receive(:new).and_return(image_service_double)

      resource_facade = ResourceFacade.new
      resource = resource_facade.find_resources(country)

      expect(resource).to be_a(Resource)
      expect(resource.country).to eq('india')

      expect(resource.video).to eq(
        title: 'Sample Video Title',
        youtube_video_id: 'sample_video_id'
      )

      expect(resource.images).to match_array([
        { alt_tag: 'Alt Tag 1', url: 'image_url_1.jpg' }
      ])
    end
  end
end