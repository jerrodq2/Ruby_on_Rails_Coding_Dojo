require 'rails_helper'

  # Go to logging_out_spec after this, the last file that has rspec in it in this project

RSpec.describe 'logging in' do
  before do
    @user = create_user
  end
  it "has login form" do
    visit new_session_path
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('Log In')
  end

  it "logs in user if email/password combo is valid" do
    log_in @user
    # log_in is a method I wrote in spec_helper, and I called the create_user method from the same file above
    expect(current_path).to eq('/events')
    expect(page).to have_text(@user.first_name)
    # In the view, I made it have the users name at the top, so I'm just testing that
  end

  it "doesn't sign in user if email is invalid" do
    log_in(@user, 'password', 'l@wrong.com')
    expect(page).to have_text('Invalid email')
  end

  it "doesn't sign in user if password is invalid" do
    log_in(@user, 'wrong password')
    expect(page).to have_text('Invalid password')
  end

end
