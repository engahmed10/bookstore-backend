require "uri"
require 'json'
require "net/http"
url = URI("https://www.googleapis.com/books/v1/volumes?q=full%20stack")
https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true
request = Net::HTTP::Get.new(url)
response = https.request(request)
response.read_body
hash = JSON.parse(response.read_body)



 hashOfBooks=hash["items"].map do |i|
    {
  
    "title": i["volumeInfo"]["title"],
    "authors": i["volumeInfo"]["authors"],
    "image": i["volumeInfo"]["imageLinks"],
    "isbn": i["volumeInfo"]["industryIdentifiers"],
    "year": i["volumeInfo"]["publishedDate"],
    "price": i["saleInfo"]["listPrice"]

    }
 end
 
 hashOfBooks.each do |book|

  book[:authors] ||= " " 
  book[:isbn] ||= " "
  book[:price] ||= " "
  book[:image] ||= " "

        Book.create(title: book[:title],authors: book[:authors][0],
        image: book[:image]["thumbnail"],isbn: book[:isbn][0]["identifier"],year: book[:year],
        price: book[:price]["amount"], user: User.first)
  end


