class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :state
  has_many :rosters
  has_many :attending_users, through: :rosters, source: :user

  has_many :comments
  has_many :commented_user, through: :comments, source: :user

  validates :name, :city, :date, :state_id, :user_id, presence: true
end
