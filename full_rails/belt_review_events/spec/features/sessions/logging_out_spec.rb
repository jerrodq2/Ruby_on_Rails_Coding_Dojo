require 'rails_helper'

RSpec.describe 'logging out' do
  before do
    @user = create_user
    log_in @user
  end

  it "should be shown as a link" do
    expect(current_path).to eq('/events')
    expect(page).to have_link('Logout')
  end

  it "logs user out and redirects to login page" do
    click_link 'Logout'
    # expect(session[:id]).to eq(nil)
    # I could try the line above, but you can't only test sessions in the controllers, I could test that it hits the destory method in the sessions controller first somehow, but I left it as is
    expect(current_path).to eq('/sessions/new')
  end

end
