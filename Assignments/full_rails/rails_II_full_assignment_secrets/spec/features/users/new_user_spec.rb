require 'rails_helper'
RSpec.describe 'signing up' do
  it 'prompts for valid fields' do
    visit '/users/new'
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_field('user[password_confirmation]')
    # For whateve reason, the first three expects translate the capital words (Name) to equal it in the form helper (:name, sent as user[:name]), but not pass confirmation.
  end
end
