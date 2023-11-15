class Api::V1::SessionsController < ApplicationController
    def create
      if User.exists?(email: session_params[:email])
        user = User.find_by(email: session_params[:email])
        if user.authenticate(session_params[:password])
          render json: UserSerializer.new(user), status: 201
        else
          render json: { error: "Incorrect email or password." }, status: 401
        end
      else
        render json: { error: "Incorrect email or password." }, status: 401
      end
    end
  
    private
  
    def session_params
      params.permit(:email, :password)
    end
end