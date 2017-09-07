class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :password, presence: true
  validates :first_name, :last_name, length: {minimum: 4}
end
