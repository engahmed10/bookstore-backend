class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :user_id, :book_id 
end
