class Human
  attr_accessor :strength, :intelligence, :stealth, :health
  def initialize
    @strength = 3
    @stealth = 3
    @intelligence = 3
    @health = 100
  end
  def attack(obj)
    if obj.class.ancestors.include?(Human)
      puts "Attacking"
      obj.health -=10
    end
  end
end
d = Human.new
a = Human.new
d.attack(a)
puts a.health
