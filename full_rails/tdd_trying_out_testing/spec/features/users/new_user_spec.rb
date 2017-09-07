require 'rails_helper'
RSpec.describe 'signing up' do
  it 'successfully creates a new user account' do
    visit "users#index"
    fill_in "First", with: "Foo"
    fill_in "Last", with: "Bar"
    fill_in "Email", with: "foo@bar.com"
    click_button "Create User"
    expect(page).to have_content "User successfully created"
  end
end
