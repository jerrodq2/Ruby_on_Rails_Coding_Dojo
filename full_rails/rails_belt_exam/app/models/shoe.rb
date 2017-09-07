class Shoe < ActiveRecord::Base
  belongs_to :user
  has_one :purchase

  validates :product, :user_id, :date, :amount, presence: true
  validates_numericality_of :amount, :on => :create
end
