class Api::V1::UsersController < ApplicationController
   skip_before_action :authorized, only: [:index,:create,:login,:autologin]
  
  
   def index
      users= User.all
      render json: UserSerializer.new(users)
    end

    def create
       user=User.new(user_params)

       if user.save
          token = encode_token({ user_id: user.id })
          render json: {user:UserSerializer.new(user),token:token}
        else
         render json: {error:"faild to create user"}
        end
     end

      def user_params
          params.permit(:username,:bio,:avatar,:email,:password)
       end

end
