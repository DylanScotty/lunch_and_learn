class Api::V1::FavoritesController < ApplicationController
    def create
      if User.exists?(api_key: params[:api_key])
        Favorite.create(favorite_params)
        render json: { success: "Favorite added successfully"}, status: 201
      else
        render json: { error: "This is not a valid api key"}, status: 401
      end
    end
  
    private
  
    def favorite_params
      params.permit(:recipe_title, :recipe_link, :country)
    end
end