require 'rails_helper'

RSpec.describe 'shoes page' do
  before do
    @user = create_user
    log_in @user
    @other_user = create_user('other', 'user', 'o@u.com', 'password', 'password')
    @shoe = create_shoe(@other_user)
    visit shoes_path
  end
  it "should show user name and dashboard link" do
    expect(page).to have_text("Hi #{@user.first_name}")
    expect(page).to have_link('Go to Dashboard')
    expect(page).to have_text('All Products')
  end
  it "should direct to dashboard if you click the dashboard link" do
    click_link 'Go to Dashboard'
    expect(current_path).to eq("/dashboard/#{@user.id}")
  end
  it "should show all shoes that haven't been bought yet with buy link" do
    expect(page).to have_text(@shoe.product)
    expect(page).to have_text(@shoe.amount)
    expect(page).to have_text(@shoe.user.first_name)
    expect(page).to have_link('Buy')
  end
  it "should show date in formatted style" do
    date = @shoe.date.strftime("%B %d, %Y")
    expect(page).to have_text(date)
  end



end
