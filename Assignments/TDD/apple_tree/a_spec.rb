require_relative 'apple'

RSpec.describe AppleTree do

  before do
    @a = AppleTree.new(4)
    @a.height = 5
  end

  it "should have a height and age" do

    expect(@a.height).to eq(5)
    expect(@a.age).to eq(4)
  end

  it "should be able to count how many apples it has" do
    expect(@a.count_apples).to eq(20)
  end

  it "has a method that increases age and height" do
    @a.year_gone_by
    expect(@a.height).to eq(6)
  end

  it "shouldn't have apples if the age is less than 3" do
    b = AppleTree.new(3)
    expect(b.apples).to eq(0)
  end

  it "has a method that picks all apples" do
    @a.pick_apples
    expect(@a.apples).to eq(0)
  end

  it "shouldn't have any apples if its older than 10 years" do
    c = AppleTree.new(10)
    expect(c.apples).to eq(0)
  end

end
