require 'rails_helper'

RSpec.describe 'Favorites by User' do
  it "Can retrieve favorites for a user" do
    user = User.create(name: 'Dylan', email: 'dt@example.com', password: '123456', password_confirmation: '123456')
    favorite1 = user.favorites.create(country: 'France', recipe_link: "https://www.bestfrancefoods.com/", recipe_title: "Escargo")
    favorite2 = user.favorites.create(country: 'China', recipe_link: "https://www.bestchinafoods.com/", recipe_title: "Fried Tofo")

    api = { api_key: "#{user.api_key}" }

    get "/api/v1/favorites", params: api

    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body)
    expect(json_response["data"]).to be_a Array

  
    expect(json_response['data'][0]['id']).to eq("#{favorite1.id}")
    expect(json_response['data'][0]['type']).to eq('favorite')
    expect(json_response['data'][0]['attributes']['recipe_title']).to eq("#{favorite1.recipe_title}")
    expect(json_response['data'][0]['attributes']['recipe_link']).to eq("#{favorite1.recipe_link}")
    expect(json_response['data'][0]['attributes']['country']).to eq("#{favorite1.country}")
    expect(json_response['data'][0]['attributes']['created_at']).to be_a String

    expect(json_response['data'][1]['id']).to eq("#{favorite2.id}")
    expect(json_response['data'][1]['type']).to eq('favorite')
    expect(json_response['data'][1]['attributes']['recipe_title']).to eq("#{favorite2.recipe_title}")
    expect(json_response['data'][1]['attributes']['recipe_link']).to eq("#{favorite2.recipe_link}")
    expect(json_response['data'][1]['attributes']['country']).to eq("#{favorite2.country}")
    expect(json_response['data'][1]['attributes']['created_at']).to be_a String
  end

  it "Will return and empty array if the user has no favorites" do
    user = User.create(name: 'Dylan', email: 'dt@example.com', password: '123456', password_confirmation: '123456')

    api = { api_key: "#{user.api_key}" }

    get "/api/v1/favorites", params: api

    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body)
    expect(json_response["data"]).to be_a Array
    expect(json_response["data"]).to eq([])
  end

  it "Will return an error if the api key is invalid" do
    user = User.create(name: 'Dylan', email: 'dt@example.com', password: '123456', password_confirmation: '123456')
    favorite1 = user.favorites.create(country: 'France', recipe_link: "https://www.bestfrancefoods.com/", recipe_title: "Escargo")
    favorite2 = user.favorites.create(country: 'China', recipe_link: "https://www.bestchinafoods.com/", recipe_title: "Fried Tofo")

    api = { api_key: "hfjkdsahfkjdsl" }

    get "/api/v1/favorites", params: api

    expect(response).to have_http_status(401)

    json_response = JSON.parse(response.body)
    expect(json_response).to be_a Hash
    expect(json_response["error"]).to eq("This is not a valid api key")
  end
end