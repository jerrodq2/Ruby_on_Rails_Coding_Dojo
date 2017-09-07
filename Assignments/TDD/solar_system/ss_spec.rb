require_relative 'solar_system'

RSpec.describe Planet do

  it "should have a name, description, and population" do
    planet1 = Planet.new
    planet1.name = 'Ackerman'
    planet1.description = 'Solar system'
    planet1.population = 2
    expect(planet1.name).to eq('Ackerman')
    expect(planet1.description).to eq('Solar system')
    expect(planet1.population).to eq(2)
  end

end

RSpec.describe SolarSystem do

  it "should have a name upon creation" do
    s1 = SolarSystem.new('Anderson')
    s2 = SolarSystem.new
    expect(s1.name).to eq('Anderson')
    expect(s2.name).to eq('Andromeda')

  end

  before do
    @ss = SolarSystem.new('Anderson')
    @p = Planet.new(@ss, 'Jupiter')
    @p = Planet.new(@ss, 'Satern')
  end

  it "should have all the planets in it" do
    expect(@ss.planets).to eq(['Jupiter', 'Satern'])
  end

  it "should be able to show number of planets" do
    expect(@ss.count).to eq(2)
  end

  it "supernova should clear all planets" do
    expect(@ss.supernova).to eq([])
  end

  it "solar system's planets array should only contain planets" do
    expect(@ss.new_planet('hi')).to eq('That is not a planet')
  end

end
