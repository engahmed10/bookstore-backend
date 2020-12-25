class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [:update,:destroy,:show,:index,:create,:login,:autologin]

    def index
       
       if params[:book_id].nil?
            comments =Comment.all
            render json: comments, include: [:book]
       else
            book=Book.find_by(id: params[:book_id])
            comment=book.comments
            render json: comment, include: [:book]
       end
    end
    
    def create 

       
        
        #token passed  from frontend and called  decode function to find the user
         token=params[:localStorage]["token"]
         #byebug
         token=JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
         user_id = token[0]["user_id"]
         comment = Comment.new(comment_params);
         comment.user_id = user_id
        if comment.save
           render json: comment 
        else
             render json: { error:" Data has not been saved " }
        end
    end



    def update 
         
         comment=Comment.find(params[:data][:comment][:id])
         comment.update(comment_params)

         if comment.save

            render json: comment

         else
            render json: {error:"not updated"}
        end

    end


    def show

        comment = Comment.find(params[:id])

        render json: comment

    end

    def destroy

       comment= Comment.find(params[:id]).destroy

       render json: comment
    end

    def comment_params
         params.require(:data).require(:comment).permit(:description,:book_id);
    end

    

end
