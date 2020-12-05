class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index,:create,:login,:autologin]

    def index
       
        comment =Comment.all
        render json: comment, include: [:book]

    end
    
    def create 

        #token passed  from frontend and called  decod function to find the user
        # byebug
         token=params[:localStorage]["token"]
         token=JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
         user_id =token[0]["user_id"]
         comment=Comment.new(comment_params);
         comment.user_id =user_id
         
        if comment.save
           render json: comment 
        else
             render json: { error:" Data has not been saved " }
        end
    end

    def comment_params

       params.require(:data).require(:comment).permit(:description,:book_id);

    end

    

end
