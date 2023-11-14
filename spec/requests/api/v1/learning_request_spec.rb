require 'rails_helper'

RSpec.describe 'Learning Resources by Country' do
  it "Can retrieve videos and images for the country", :vcr do
    params = { country: "France" }
    get "/api/v1/learning_resources", params: params

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response).to be_a Hash
    expect(json_response['data']['id']).to eq nil
    expect(json_response['data']['type']).to eq "learning_resources"
    expect(json_response['data']['attributes']['country']).to eq "France"

    expect(json_response['data']['attributes']['video']['title']).to be_a String
    expect(json_response['data']['attributes']['video']['youtube_video_id']).to be_a String

    expect(json_response['data']['attributes']['images'][0]['alt_tag']).to be_a String
    expect(json_response['data']['attributes']['images'][0]['url']).to be_a String
    expect(json_response['data']['attributes']['images'][1]['alt_tag']).to be_a String
    expect(json_response['data']['attributes']['images'][1]['url']).to be_a String
  end

  it "Should return an empty object if there are no resources", :vcr do
    params = { country: "Genovia" }
    get "/api/v1/learning_resources", params: params

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response).to be_a Hash
    expect(json_response['data']['id']).to eq nil
    expect(json_response['data']['type']).to eq "learning_resources"
    expect(json_response['data']['attributes']['country']).to eq "Genovia"

    expect(json_response['data']['attributes']['video']).to eq({})

    expect(json_response['data']['attributes']['images']).to eq []
  end
end