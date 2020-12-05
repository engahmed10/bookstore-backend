class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'my_s3cr3t')
    end
  
    def auth_header
        
      request.headers['HTTP_AUTORIZATION']#.split(' ')[1]
    end
    
   
    def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          begin
            JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
          rescue JWT::DecodeError
            []
          end
        end
      end

    def session_user
      
        if  decoded_token 
            puts decoded_token.class
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
            
        else
            nil 
        end

    end


    def logged_in?
        !! session_user
    end
  
    def  authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
      
    end
 
end


