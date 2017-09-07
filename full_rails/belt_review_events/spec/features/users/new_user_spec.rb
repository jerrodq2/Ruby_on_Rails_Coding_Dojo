require 'rails_helper'

RSpec.describe 'new user page' do
  before do
    visit new_user_path
  end
  it "should have the proper field" do
    expect(page).to have_field("First name")
    expect(page).to have_field('Last name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_field('Password confirmation')
    expect(page).to have_button('Create User')
  end

end
