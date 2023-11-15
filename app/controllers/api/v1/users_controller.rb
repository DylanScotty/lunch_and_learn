class Api::V1::UsersController < ApplicationController
    def create
      if user_params[:password] != user_params[:password_confirmation]
        render json: { error: "Passwords do not match" }, status: 422
      elsif User.exists?(email: user_params[:email])
        render json: { error: "That email is already in use"}, status: 409
      else
        render json: UserSerializer.new(User.create(user_params)), status: 201
      end
    end
  
    private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end