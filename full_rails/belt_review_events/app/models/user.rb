class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  # a regex that I use so that all emails are basically in the format of "j@j.com"
  has_secure_password
  # has_secure_password must be included in the model, this allows you to save a hashed password_digest, allows you to use a password_confirmation, and allows an authenticate method that returns the user when the password is correct (see section below)
  belongs_to :state # each user has a state_id, rather each user lives in/belongs to a state
  has_many :events # the events created by this user
  has_many :rosters # an intermediary table for events and users since they are a many_to_many relationship, each row has a user_id and event_id
  has_many :attending_events, through: :rosters, source: :event # the events that this user is attending, has to be named differently since "has_many :events" is already written
  has_many :comments # the comments written by this user
  has_many :commented_events, through: :comments, source: :event # the events that this user has commented on, has to be named differently since "has_many :comments" is already written

  # For the above relationships, notice the "attending_events" and "commented_events" lines. For attending_events, this is how many events the user is attending. Ordinarily, it would just be has_many :events, through: :rosters (see blogs2 in Rails_models for an example), but this is already taken, so we have to choose another word/phrase so rails knows what exactly we're talking about. the exact wording can be whatever you want, the important part is "source: :event", that tells it exactly what table you mean




  validates :first_name, :last_name, :email, :city, :state_id, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  # For the above validation, the "uniqueness" means that no other user can have the same email. If a user with "j@j.com" already exists, it won't create a new user if you give it an email of "j@j.com" (you should also be able to use "validates_uniqueness_of" but you would probably have to change the format). Also, setting case_sensitive to false, basically makes it not care about case. For example: if it was not included or set to false, then one user could have "J@j.com" and a second user could have "j@j.com", since their case is different, they are read as different emails. But with case_sensitive set to false, it reads them both as "j@j.com". And "format: {with: ...}" just matches the format of email with the email regex I defined above
  validates :password, :password_confirmation, presence: true, length: {minimum: 6}
  # the validation is relatively simple, you need to have both "password" and "password_confirmation" before you can create a user, and "password" has to be at least 6 characters long. The below validation also makes it neccessary for "password" and "password_confirmation" match before it can create a new user. By default, these validations are also active if you try to update the record. So you can't successfully update the password of a user unless it is 6 chars long, and you include a "password_confirmation" that matches it. You could include "if: :password_digest_changed?" and use it with callbacks such as before_save. Can see more at: http://api.rubyonrails.org/classes/ActiveModel/Dirty.html
  validates_confirmation_of :password
  # by putting validates_confirmation_of :password, it makes it necessary to include "password_confirmation" when creating a new user or new record in the User table. Though password_confirmation won't actually be saved in any column.


  # PASSWORD INFO: putting has_secure_password allows you to use an authenticate method, which returns true or false. So basically, if I created a user: "User.create(:first_name => 'Jerrod', :password => 'foobar'.....)", then I can use authenticate to test if a password is correct. As an example: if I plugged that user into a variable with: "user=User.find_by(first_name: 'Jerrod')", then running "user.authenticate("not_the_right_password")" would return false. But, "user.authenticate("foobar")" would return the the actual instance of the user, which is the same as true in a boolean context. Can see examples in the user and session controller. Also, notice that even though it is created with the model as password_digest it is referred to everywhere outside of the schema.rb file as just "password".
end
