class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :age, presence: true
  validates_length_of :first_name, :last_name, :minimum => 2
  validates_numericality_of :age, :only_integer => true
  validates_inclusion_of :age, :in => 10...150, :message => "Can only be between 10 and 150"
end


# ALSO WORKS
#
# class User < ActiveRecord::Base
#   validates :first_name, :last_name, :email_address, :age, presence: true
#   validates :age, numericality: { greater_than_or_equal_to: 10, less_than: 150 }
#   validates :first_name, :last_name, length: { minimum: 2 }
# end
