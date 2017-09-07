(1..255).each{|i| print i}

(1..255).each{|i| print i if i%2 != 0}

# print sum
sum = 0
for i in 1..255
  sum += i
  puts "New Number: #{i} Sum: #{sum}"
end

# Iterating through an array
[1,2,3,4,5].each{|i| puts i}

# Find Max
puts [1,2,3,4,5].max

# Get Average
def avg(arr)
  sum = 0
  arr.each{|i| sum += i}
  puts sum/arr.length
end
avg([2, 30, 10])

# Array with Odd Numbers
def arrOdd
  arr = []
  (1..255).each{arr.push(i) if i%2 != 0}
  puts arr
end
arrOdd()

# Greater than Y
def greater(arr, num)
  count = 0
  arr.each{|i| count +=1 if i > num}
  puts count
end
greater([1,2,3,4,5], 2)

# square the values
def square(arr)
  puts arr.map{|i| i * i}
end
square([2, 3, 5])

# Elminate negative numbers
def eliminate(arr)
  arr.map!{|i|
    if i < 0
      i = 0
    else
      i
    end
  }
  puts arr
end
# eliminate([1, 5, 10, -2, -5])

# Max. Min. and Average
def all(arr)
  puts arr.max
  puts arr.min
  sum = 0
  arr.each{|i| sum += i}
  puts sum
end
all([1, 5, 10, -2])

# Shifting the values in an array
def shift(arr)
  puts arr.slice(1, arr.length-1)
end
shift([1, 5, 10, -2])

# Number to String
def numToStr(arr)
  puts arr.map{|i|
    if i < 0
      i = 'Dojo'
    else
      i
    end}
end
numToStr([1, 5, 10, -2, -5])
