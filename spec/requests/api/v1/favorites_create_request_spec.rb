require 'rails_helper'

RSpec.describe "Favorites" do
  it "can create new favorite recipe" do
    user = User.create(name: 'Dylan', email: 'dt@example.com', password: '123456', password_confirmation: '123456')

    new_fav_data = {
      'api_key': "#{user.api_key}",
      'country': 'china',
      'recipe_link': "https://www.chinasbestfoods.com/",
      'recipe_title': "Mapo Tofu"
    }

    post "/api/v1/favorites", params: new_fav_data, as: :json

    expect(response).to have_http_status(201)
  end

  it "Will return an error if the api key is invalid" do
    new_fav_data = {
      'api_key': "djklajflkdjsal;kfsd",
      'country': 'china',
      'recipe_link': "https://www.chinasbestfoods.com/",
      'recipe_title': "Mapo Tofu"
    }

    post "/api/v1/favorites", params: new_fav_data, as: :json

    expect(response).to have_http_status(401)
  end
end