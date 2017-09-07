class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  belongs_to :state
  has_many :events
  has_many :rosters
  has_many :attending_events, through: :rosters, source: :event
  has_many :comments
  has_many :commented_events, through: :comments, source: :event


  validates :first_name, :last_name, :email, :city, :state_id, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 6}, if: :password_digest_changed?
  validates_confirmation_of :password


end
