class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id ,:title, :authors, :price, :year , :image, :isbn
end
