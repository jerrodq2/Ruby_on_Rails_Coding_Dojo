class Post < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :blog
  has_many :messages
  validates :title, :content, presence: true
end
