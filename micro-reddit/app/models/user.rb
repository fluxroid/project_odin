class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true,
   length: {maximum: 50}
   has_many :posts
   has_many :comments
end
