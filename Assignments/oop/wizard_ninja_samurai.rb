require_relative 'human'
class Wizard < Human
  def initialize
    @health = 50
    @intelligence = 25
  end
  def heal
    @health += 10
    self
  end
  def fireball(obj)
    attack(obj)
    obj.health -= 20
    self
  end
end

class Ninja < Human
  def initialize
    @stealth = 175
  end
  def steal(obj)
    attack(obj)
    @health += 10
    self
  end
  def get_away
    @health -= 15
  end
end

class Samurai < Human
  @@samurais = 0
  def initialize
    @health = 200
    @@samurais += 1
  end
  def death_blow(obj)
    obj.health = 0
    self
  end
  def meditate
    @health = 200
  end
  def how_many
    puts "ther are #{@@samurais}"
  end
end
b = Samurai.new
a = Samurai.new
b.how_many
