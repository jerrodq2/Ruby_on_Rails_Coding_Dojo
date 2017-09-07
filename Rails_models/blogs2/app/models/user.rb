class User < ActiveRecord::Base
  has_many :blogs, through: :owners
  has_many :owners
  has_many :posts
  has_many :messages
  validates :first_name, :last_name, :email, presence: true
end
