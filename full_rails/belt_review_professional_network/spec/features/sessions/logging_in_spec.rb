require 'rails_helper'

RSpec.describe 'logging in' do
  before do
    @user = create_user
  end
  it "has login form" do
    visit new_session_path
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_link('Register')
  end
  it "logs in user if email/password combo is valid" do
    log_in @user
    expect(current_path).to eq(MAINPAGE)
    expect(page).to have_text(@user.first_name)
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
