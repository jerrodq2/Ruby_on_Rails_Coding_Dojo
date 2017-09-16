require 'rails_helper'

# Go to logging_in_spec next

# Whereas the new_user_spec file just tested that the page had the correct fields, this one test that when you put in data in the form, the correct things happen.

RSpec.describe 'creating user' do
  before do
    create_state
    visit new_session_path
  end
  it "should create new user and redirect to profile page" do
    fill_in 'First name', with: 'Tony'
    fill_in 'Last name', with: 'Stark'
    fill_in 'Email', with: 'ironman@gmail.com'
    fill_in 'City', with: 'Dallas'
    select "TX", from: 'State'
    fill_in 'Password', with: 'Password'
    fill_in 'Password confirmation', with: 'Password'
    click_button 'Create User'
    expect(current_path).to eq("/events")
  end
  # IMPORTANT Note: above, I select "TX" from 'State', this is how it sounds, it finds the select input: "State", capizalized because it sees the label from the form helper, it would see the name value otherwise, and selects the option 'TX'. BUT, my select input in the view takes all the states from my state model and puts each of them in an opion for this select input. Since rspec tests start out with a blank database, this test would fail, so I had to run the create_state method in the before block (which created "TX"). So, this test sees a view with only that one value/option that can be selected. Important to remember that

  it "shows validations without proper credential" do
    click_button 'Create User'
    expect(current_path).to eq(new_session_path)
    expect(page).to have_text('invalid')
    # This test just makes sure that I try to create a new user without anything filled in, it sends me right back with error messages. We already tested in the model that I need each field, so this just test that I send back the messages, which would contain 'invalid'. I could go deeper and make sure that it has different messages, but for time sake, I didn't
  end

end
