require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = create_user
    @second_user = create_user('other', 'user', 'o@u.com', 'password', 'password')
    @shoe = create_shoe(@user)
    @bad = Purchase.new
    @bad.valid?
    @good = create_purchase(@user, @shoe, @second_user)
  end
  it "requires a date" do
    expect(@bad.errors[:date].any?).to eq(true)
  end
  it "should have a proper date" do
    good = Purchase.new(date:Time.new().to_date)
    bad = Purchase.new(date: 'hey')
    good.valid?
    bad.valid?
    expect(good.errors[:date].any?).to eq(false)
    expect(bad.errors[:date].any?).to eq(true)
  end
  it "should have a seller id" do
    expect(@bad.errors[:seller_id].any?).to eq(true)
  end
  it "should be connected to a seller" do
    expect(Purchase.first.seller).to eq(@second_user)
  end
  it "should have a buyer id" do
    expect(@bad.errors[:buyer_id].any?).to eq(true)
  end
  it "should be connected to a buyer" do
    expect(Purchase.first.buyer).to eq(@user)
  end
  it "should have a shoe id" do
    expect(@bad.errors[:shoe_id].any?).to eq(true)
  end
  it "should be connected to a shoe" do
    expect(Purchase.first.shoe).to eq(@shoe)
  end

end
