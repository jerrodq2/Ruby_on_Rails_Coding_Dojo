require 'rails_helper'

RSpec.describe 'logging out' do
  before do
    @user = create_user
    log_in @user
  end
  it "should be shown as a link" do
    expect(current_path).to eq(MAINPAGE)
    expect(page).to have_link('Logout')
  end
  it "logs user out and redirects to login page" do
    click_link 'Logout'
    expect(current_path).to eq('/sessions/new')
  end

end
