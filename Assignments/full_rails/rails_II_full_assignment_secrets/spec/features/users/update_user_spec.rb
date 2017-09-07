require 'rails_helper'
RSpec.describe 'updating user' do
  it 'updates user and redirects to profile page' do
    user = create_user
    log_in user
    expect(page).to have_text('kobe')
    click_link 'Edit Profile'
    fill_in 'Name', with: 'drake'
    fill_in 'Password', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Update User'
    expect(page).to have_text('drake')
  end
end
