require 'rails_helper'

RSpec.describe 'Favorite Serializer' do
  it "returns the JSON favorite object within the serializer's format" do
    user = User.create(name: 'Dylan', email: 'dt@example.com', password: '123456', password_confirmation: '123456')
    favorite1 = user.favorites.create(country: 'France', recipe_link: "https://www.bestfrancefoods.com/", recipe_title: "Escargo")
    favorite2 = user.favorites.create(country: 'China', recipe_link: "https://www.bestchinafoods.com/", recipe_title: "Fried Tofo")

    serialized_favorites = FavoriteSerializer.new(user.favorites)

    expected_format = {
      data: [
        {
          id: "#{favorite1.id}",
          type: "favorite",
          attributes: {
            recipe_title: "Escargo",
            recipe_link: 'https://www.bestfrancefoods.com/',
            country: 'France',
            created_at: "#{favorite1.created_at}"
          }
        },
        {
          id: "#{favorite2.id}",
          type: "favorite",
          attributes: {
            recipe_title: 'China',
            recipe_link: 'https://www.bestchinafoods.com/',
            country: 'Fried Tofo',
            created_at: "#{favorite2.created_at}"
          }
        }
      ]
    }     
  end
end