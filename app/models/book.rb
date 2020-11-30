class Book < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, presence: true
    validates :authors, presence: true
end
