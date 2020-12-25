class Api::V1::BooksController < ApplicationController
    skip_before_action :authorized, only: [:show,:index,:login]
    
    def index 
       books = Book.all
       render json: books ,include: [:comments] 
    end 

    def show 
         book= Book.find(params[:id])
         render json: book,include: [:comments]
    end


    

end
