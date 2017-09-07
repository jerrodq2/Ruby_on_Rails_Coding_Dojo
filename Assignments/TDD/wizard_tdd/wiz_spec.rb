require_relative 'wizard'

RSpec.describe Wizard do

  before do
    @wiz = Wizard.new
  end

  it "should have health of 50 and int of 25" do
    expect(@wiz.health).to eq(50)
    expect(@wiz.intelligence).to eq(25)
  end

  it "should have human in its ancestor chain" do
    expect(@wiz.class.ancestors).to include(Human)
  end

  describe 'methods' do

    before do
      @other = Wizard.new
      @wiz.heal
      @wiz.fireball(@other)
    end

    it "has method that heals wizard by 10" do
      expect(@wiz.health).to eq(60)
    end

    it "has method that attacks target" do
      expect(@other.health).to eq(20)
    end
  end #end of inner describe

end
