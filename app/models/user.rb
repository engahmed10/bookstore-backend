class User < ApplicationRecord

    has_many :books
    has_many :comments
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true 
    validates :username, uniqueness: {case_sensitive: false}

end
