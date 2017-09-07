class Purchase < ActiveRecord::Base
  belongs_to :seller, :class_name => 'User'
  belongs_to :buyer, :class_name => 'User'
  belongs_to :shoe
  validates :date, :seller_id, :buyer_id, :shoe_id, presence: true
end
