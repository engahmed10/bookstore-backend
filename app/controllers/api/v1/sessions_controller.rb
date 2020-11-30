class Api::V1::SessionsController < ApplicationController

    def login
      user=User.find_by(username:params[:username])
      if user  && user.authenticate(params[:password])
        token = encode_token({user_id: user.id})
        render json: {user:user,token:token}
      else
        render json: {error: "invalid username or password"}
      end
    end

    def autologin
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

end