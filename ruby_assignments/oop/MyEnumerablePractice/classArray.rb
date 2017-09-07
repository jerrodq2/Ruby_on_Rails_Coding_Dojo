require_relative 'module'

class Array
  include MyEnumerable
end
[1, 2, 3].my_each{|i| puts i}
