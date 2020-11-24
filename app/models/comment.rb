class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :discription, presence: true
end
