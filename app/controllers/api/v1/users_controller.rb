class Api::V1::UsersController < ApplicationController

    def index
     users= User.all
      render json: users
    end

    def create
       user=User.create(user_params)
       
       render json: user
    end

    def user_params
      params.require(:user).permit(username:params[:username],email:params[:email],password:[:password])
    end
end
