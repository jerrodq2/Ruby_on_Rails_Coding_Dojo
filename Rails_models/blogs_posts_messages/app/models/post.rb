class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :messages
  validates :title, :content, presence: true, length: {minimum: 7}

  before_destroy :delete_messages

  def delete_messages
    Post.find(self.id).messages.destroy_all
  end


end
