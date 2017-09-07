require 'rails_helper'
RSpec.describe 'creating likes' do
  before do
    @user = create_user
    log_in @user
    @user.secrets.create(content: 'Oops')
  end
  it 'creates like and displays it both in profile and secrets page' do
    visit '/secrets'
    expect(page).to have_text('Likes: 0')
    click_button 'Like'
    expect(current_path).to eq('/secrets')
    expect(page).to have_text('Likes: 1')
    visit "/users/#{@user.id}"
    expect(page).to have_text('Likes: 1')
  end
end
