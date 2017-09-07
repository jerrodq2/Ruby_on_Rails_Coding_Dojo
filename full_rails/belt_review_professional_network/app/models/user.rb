class User < ActiveRecord::Base
  has_many :networks
  has_many :associates, through: :networks
  has_many :invitations
  has_many :invite_senders, through: :invitations
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  validates :name, :email, :description, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :description, length: {minimum: 10}
  validates :password, presence: true, length: {minimum: 6}, if: :password_digest_changed?
  validates_confirmation_of :password
end
