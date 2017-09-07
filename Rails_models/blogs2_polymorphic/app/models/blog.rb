class Blog < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :users, through: :owners
  has_many :owners
  has_many :posts
  has_many :messages, through: :posts
  validates :name, :description, presence: true

  before_destroy :finish_comments


def finish_comments
  Blog.find(self.id).comments.destroy_all
end


end
