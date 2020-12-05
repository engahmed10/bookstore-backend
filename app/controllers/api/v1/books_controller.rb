class Api::V1::BooksController < ApplicationController
    skip_before_action :authorized, only: [:index,:login]
    
    def index 
        
       books = Book.all
       
       render json: books ,include: [:comments] 
    end 

end
