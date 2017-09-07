require 'rails_helper'

RSpec.describe Shoe, type: :model do
  before do
    @shoe = Shoe.new
    @shoe.valid?
    @user = create_user
    @second_shoe = create_shoe(@user)
  end
  it "requires a product" do
    expect(@shoe.errors[:product].any?).to eq(true)
  end
  it "requries a user" do
    expect(@shoe.errors[:user_id].any?).to eq(true)
  end
  it "requires a date" do
    expect(@shoe.errors[:date].any?).to eq(true)
  end
  it "requires an amounts" do
    expect(@shoe.errors[:amount].any?).to eq(true)
  end
  it "requies amount to be a number" do
    shoe = Shoe.new(amount: 'one')
    shoe.valid?
    expect(shoe.errors[:amount].any?).to eq(true)
  end
  it "should be connected to a user" do
    expect(Shoe.find(@second_shoe.id).user).to eq(@user)
  end
  it "should have a defualt status" do
    expect(Shoe.pluck(:status).first).to eq('For sale')
  end
  it "should have a proper date" do
    shoe = Shoe.new(date:Time.new().to_date)
    wrong = Shoe.new(date: 'hey')
    shoe.valid?
    wrong.valid?
    expect(shoe.errors[:date].any?).to eq(false)
    expect(wrong.errors[:date].any?).to eq(true)
  end
end
