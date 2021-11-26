class Post < ApplicationRecord
  validates :title, :author, :body, presence: true

  has_many :comments #tem vários commentários
end
