class User < ActiveRecord::Base
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates_confirmation_of :password #This validates_confirmation_of meanst that whatever field it is for (password in this case), it expects there to be a confirmation that comes with it, and it should be letter for letter itself with _confirmation, in other words, If if do this for password, it expects to be given both password and password_confirmation and for them to match, if I did it with email, then email would have to match email_confirmation.
end
