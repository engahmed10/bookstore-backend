class Api::V1::UsersController < ApplicationController

    def index
      users= User.all
      render json: UserSerializer.new(users)
    end

    def create
       user=User.create(user_params)
       # byebug
       if user.valid?
       
          render json: UserSerializer.new(user), status: :created
       else
         render json: {error:"faild to create user"}
       end
    end

    def user_params
      params.permit(:username,:bio,:avatar,:email,:password)
    end
end
