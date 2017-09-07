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
# wiz = Wizard.new
# other = Wizard.new
# wiz.fireball(other)
