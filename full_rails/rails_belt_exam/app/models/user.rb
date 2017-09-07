class User < ActiveRecord::Base
  has_many :shoes
  has_many :purchases
  has_many :buyers, through: :purchase
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 6}, if: :password_digest_changed?
  validates_confirmation_of :password
end
