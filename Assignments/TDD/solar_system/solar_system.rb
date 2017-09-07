class SolarSystem
  attr_accessor :name
  attr_reader :planets
  def initialize(name='Andromeda')
    @name = name
    new_planet
  end

  def count
    @planets.length
  end

  def new_planet(val = 'name')
    if (!@planets)
      @planets = []
    elsif (val.class.ancestors.include?(Planet))
      @planets.push(val.name) 
    else
      return 'That is not a planet'
    end
  end

  def supernova
    @planets.clear
  end
end
ss = SolarSystem.new

class Planet
  attr_accessor :name, :description, :population
  def initialize(ss='nonSystem', name='planet')
    @name = name
    if ss.class.ancestors.include?(SolarSystem)
      ss.new_planet(self)
    end
  end
end
p = Planet.new(ss)
