class Comment < ApplicationRecord
  validates :author, :body, presence: true
  
  belongs_to :post #pertence a um post
end
