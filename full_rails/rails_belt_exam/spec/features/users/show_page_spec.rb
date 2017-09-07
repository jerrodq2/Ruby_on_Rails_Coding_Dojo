require 'rails_helper'

RSpec.describe 'show page' do
  before do
    @user = create_user
    log_in @user
  end
  it "should have acces to user's info and all products link" do
    expect(page).to have_text("Hi #{@user.first_name}")
    expect(page).to have_link('Go to All Products')
  end
  it "should direct to shoes page if you click all products link" do
    click_link 'Go to All Products'
    expect(current_path).to eq(shoes_path)
  end
  it "should have empty tables to start" do
    expect(page.find('.yours')).to have_text(' - ')
    expect(page.find('.sold')).to have_text(' - ')
    expect(page.find('.bought')).to have_text(' - ')
  end
  it "should show totals as $0 in the beginning" do
    expect(page.find('.bought_total')).to have_text("Total: $0")
    expect(page.find('.sold_total')).to have_text("Total: $0")
  end

  describe 'should show' do
    before do
      @shoe = create_shoe(@user)
      visit "/dashboard/#{@user.id}"
    end
    it "proper info for each product" do
      expect(page).to have_text(@shoe.product)
      expect(page).to have_text(@shoe.amount)
    end
    it "date in formatted style" do
      date = @shoe.date.strftime("%B %d, %Y")
      expect(page).to have_text(date)
    end
  end



end
