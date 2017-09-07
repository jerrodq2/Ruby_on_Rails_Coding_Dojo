require 'rails_helper'

RSpec.describe 'Delete shoe' do
  before do
    @user = create_user
    log_in @user
    @shoe = create_shoe(@user)
    visit "/dashboard/#{@user.id}"
  end
  it "should have a button on the show page" do
    expect(page).to have_text(@shoe.product)
    expect(page).to have_link('Remove')
  end
  it "should be deleted and no longer show up on the show or shoes page" do
    click_link 'Remove'
    expect(page).to_not have_text(@shoe.product)
    visit shoes_path
    expect(page).to_not have_text(@shoe.product)
  end
end
