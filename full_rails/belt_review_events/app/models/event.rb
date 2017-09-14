class Event < ActiveRecord::Base
  belongs_to :user #which user created this event
  belongs_to :state # which state the event takes place in
  has_many :rosters # an intermediary table for events and users since they are a many_to_many relationship, each row has a user_id and event_id
  has_many :attending_users, through: :rosters, source: :user # the users that are attending this event

  has_many :comments # the comments that are owned by this event
  has_many :commented_user, through: :comments, source: :user # the users that have commented on this event

  validates :name, :city, :date, :state_id, :user_id, presence: true\

  #see the user's model to further understand the :attending_users and :commented_user lines
end
