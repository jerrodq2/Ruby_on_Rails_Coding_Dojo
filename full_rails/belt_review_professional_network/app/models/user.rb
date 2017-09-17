class User < ActiveRecord::Base
  has_many :networks
  has_many :associates, through: :networks
  has_many :invitations, foreign_key: 'reciever_id' #these are invites that this user himself sent out. In the invitation model, this column is named "reciever_id", so if I don't put "foreign_key", then rails will look for a user_id or invitation_id column and error out. Using foreign_key tells rails which column I am referring to.
  has_many :senders, through: :invitations # these are invites that this user recieved, or was the reciever of. I don't have to use foreign_key here because I named this has_many the same as the id. Meaning, in the invitation model, the column I am referring to is called "sender_id", so since I named it senders, or the same as the foreign_key, I don't need to specify what foreign_key I mean. Same goes for how I used has_many :associates, though I most likely would have used source: since it was after a "through:" 
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  validates :name, :email, :description, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :description, length: {minimum: 10}
  validates :password, presence: true, length: {minimum: 6}, if: :password_digest_changed?
  validates_confirmation_of :password
end
