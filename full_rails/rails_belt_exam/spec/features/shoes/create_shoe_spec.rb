require 'rails_helper'

RSpec.describe 'Creating a shoe' do
  before do
    @user = create_user
    log_in @user
  end
  it "should be done on the show page" do
    expect(page).to have_text('Sell Product')
    expect(page).to have_field("shoe_product")
    expect(page).to have_field('Amount')
    expect(page).to have_button('Sell')
  end
  it "should redirect to show page and make shoe show in your products table" do
    fill_in 'shoe_product', with: 'first shoe'
    fill_in 'Amount', with: 50
    click_button 'Sell'
    expect(current_path).to eq("/dashboard/#{@user.id}")
    expect(page.find('.yours')).to have_text('first shoe')
  end
  it "should show validations" do
    click_button 'Sell'
    expect(page).to have_text("Product can't be blank")
    expect(page).to have_text("Amount can't be blank")
  end
  it "should't show up in your sales or purchases table" do
    fill_in 'shoe_product', with: 'first shoe'
    fill_in 'Amount', with: 50
    click_button 'Sell'
    expect(page.find('.sold')).to_not have_text('first shoe')
    expect(page.find('.bought')).to_not have_text('first shoe')
  end
end
