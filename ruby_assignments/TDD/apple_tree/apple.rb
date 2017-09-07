class AppleTree
  attr_accessor :height, :age, :apples
  def initialize(age)
    @age = age
    if(age>3 && age < 10)
      @apples = @age*5
    elsif (age > 9)
      @apples = 0
    else
      @apples = 0
    end
  end

  def count_apples
    @apples
  end
  def year_gone_by
    @age += 1
    @height += 1
  end
  def pick_apples
    @apples = 0
  end
end
a = AppleTree.new(4)
