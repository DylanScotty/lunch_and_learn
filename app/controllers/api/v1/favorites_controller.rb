class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      favorite = user.favorites.create(favorite_params)
      render json: { success: "Favorite added successfully" }, status: 201
    else
      render json: { error: "This is not a valid api key"}, status: 401
    end
  end

  def index
    if User.exists?(api_key: params[:api_key])
      user = User.find_by(api_key: params[:api_key])
      serialized_favorites = FavoriteSerializer.new(user.favorites)
      render json: serialized_favorites, status: 200
    else
      render json: { error: "This is not a valid api key"}, status: 401
    end
  end

  private

  def favorite_params
    params.permit(:recipe_title, :recipe_link, :country)
  end
end