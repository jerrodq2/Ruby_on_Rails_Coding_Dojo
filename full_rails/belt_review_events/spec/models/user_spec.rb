require 'rails_helper'

# After this file, look at sessions_controller_spec
#This file was created when I created the User model. The basics of Rspec are this, every block of code, or every test is basically comprised of: it "does something" do ....code here..... end
# Ex:
# it "requires a first_name" do
#   .....
# end

# Two other things I commonly use, is "before do", which you can see in sessions_controller, and "describe 'something' do" which you can see in users_controller

RSpec.describe User, type: :model do
# The line above is there by default, all rspec code for this file needs to be between the do above and the end at the bottom. This line is necessary for models, controllers, and views, though everything after describe isn't necessary for rspec in general. It goes like "RSpec.describe Name, type: :model/controller/view do". But, as you can see in my features folder, I start my files with "RSpec.describe 'whatever I want to name it' "

# A basic test below for a model
  it "requires a first name" do
    user = User.new
    user.valid?
    expect(user.errors[:first_name].any?).to eq(true)
  end
  # This test basically creates a potential user with User.new, and tests it with user.valid without giving it any values, so as a blank instance. If I wrote my model file correctly, then everything that had presence: true, should return an error, so it checks if the first_name column/attribute returned any errors

  it "requires a last name" do
    user = User.new
    user.valid?
    expect(user.errors[:last_name].any?).to eq(true)
  end

  it "requires an email" do
    user = User.new
    user.valid?
    expect(user.errors[:email].any?).to eq(true)
  end

  it 'accepts properly formatted email' do
    emails = ['kobe@lakers.com', 'kobe.bryant@lakers.com']
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(false)
    end
  end

  it 'rejects improperly formatted email' do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it 'requires a unique, case insensitive email address' do
    create_state
    # I need to put one state in the db with the above method, because whe you run an rspec test, the database is always empty, so the "State.first" below would be equal to nil, and I wouldn't be able to create user1
    user1 = User.create(first_name:'kobe', last_name: 'bryan', email: 'kobe@lakers.com', password: 'password', password_confirmation: 'password', city: 'Dallas', state: State.first)
    user2 = User.new(email: user1.email.upcase)
    user2.valid?
    expect(user2.errors[:email].first).to eq("has already been taken")
  end

  it "requires a state" do
    user= User.new
    user.valid?
    expect(user.errors[:state_id].any?).to eq(true)
    # Notice I put state_id above, and not state, either because this is how the actual column is or how it is written in the model for the "presence: true" validation
  end

  it "requires a password" do
    user = User.new
    user.valid?
    expect(user.errors[:password].any?).to eq(true)
  end

  it "requires a password to be at least 6 characters long" do
    user = User.new(password: '1234')
    user.valid?
    expect(user.errors[:password].any?).to eq(true)
    expect(user.errors[:password].first).to eq('is too short (minimum is 6 characters)')
    # Just testing out a more specific test, by default user.errors[:password] is returned in an array format but still as an instance, even if there is only one error message, so I access the first error with .first
  end

  it 'requires the password to match the password confirmation' do
    user = User.new(password: 'password', password_confirmation: 'not password')
    user.valid?
    expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
  end

  it 'automatically encrypts the password into the password_digest attribute' do
    user = User.create(first_name:'kobe', last_name: 'bryan', email: 'kobe@lakers.com', password: 'password', password_confirmation: 'password')
    expect(user.password_digest.present?).to eq(true)
    expect(user.password_digest.length).to be > 8
    # The above line isn't really necessary, password_digest.present tests if it is hashed or not, but I just played around with another way to test it, since I created it with an 8 character hash, then it would be longer than that if it was hashed. You should go with password_digest.present? though
  end


end
