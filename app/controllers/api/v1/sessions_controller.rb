class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:login,:autologin]

    def login
      @user=User.find_by(username:params[:username])
      
      if @user  && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user:@user,token:token}
      else
        render json: {error: "invalid username or password"}
      end
    end

    def autologin   
      
     if  session_user
      render json: session_user, status: :accepted
     else
       render json: {error: 'no user'} 
     end
       
    end

end