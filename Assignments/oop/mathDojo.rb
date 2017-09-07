# class MathDojo
#   attr_accessor :answer
#   def initialize
#     @answer = 0
#   end
#   def add(num, num2=0)
#     @answer += (num + num2)
#     self
#   end
#   def subtract(num1, num2=0)
#     @answer -= (num + num2)
#     self
#   end
# end
#
# one = MathDojo.new
# puts one.add(1,2).add(3).answer



class MathDojo
  attr_accessor :answer
  def initialize
    @answer = 0
  end
  def add(num)
    if num.class == Array
      @answer += num.flatten.reduce(:+)
    else
      @answer += num
    end
    self
  end
  def subtract(num)
    if num.class == Array
      @answer -= num.flatten.reduce(:+)
    else
      @answer -= num
    end
    self
  end
end

one = MathDojo.new
puts one.add(1).add([1, 2, 3]).answer
puts one.subtract(1).subtract([1,2]).answer
