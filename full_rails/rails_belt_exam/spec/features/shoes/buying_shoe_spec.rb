require 'rails_helper'

RSpec.describe 'buying a shoe' do
  before do
    @user = create_user
    log_in @user
    @other_user = create_user('other', 'user', 'o@u.com', 'password', 'password')
    @shoe = create_shoe(@other_user)
    visit shoes_path
    click_link 'Buy'
  end
  it "should redirect to dashboard and change location on the dashboard page" do
    expect(page.find('.yours')).to_not have_text(@shoe.product)
    expect(page.find('.sold')).to_not have_text(@shoe.product)
    expect(page.find('.bought')).to have_text(@shoe.product)
      expect(current_path).to eq("/dashboard/#{@user.id}")
  end
  it "should affect the total of your puchases table" do
    expect(page.find('.bought_total')).to have_text("Total: $#{@shoe.amount}")
  end
  it "should make shoe dissapear from shoes pages" do
    visit shoes_path
    expect(page).to_not have_text(@shoe.product)
  end

  describe 'should cause' do
    before do
      click_link 'Logout'
      log_in @other_user
    end
    it "the shoe to dissapear form it's creator's products table" do
      expect(page.find('.yours')).to_not have_text(@shoe.product)
    end
    it "to appear only in the selling table of it's creators dashboard" do
      expect(page.find('.sold')).to have_text(@shoe.product)
      expect(page.find('.bought')).to_not have_text(@shoe.product)
    end
    it "should affect the total of his/her sales table" do
      expect(page.find('.sold_total')).to have_text("Total: $#{@shoe.amount}")
    end
  end


end
