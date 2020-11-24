class Book < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :username, presence: true
    validates :email, presence: true
end
