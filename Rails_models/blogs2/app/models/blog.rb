class Blog < ActiveRecord::Base
  has_many :users, through: :owners
  has_many :owners
  has_many :posts
  has_many :messages, through: :posts
  validates :name, :description, presence: true
end
