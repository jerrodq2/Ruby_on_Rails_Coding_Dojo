
def firstPuzzle(arr)
  sum = 0
  arr.each{|i| sum += i}
  puts sum
  return arr.find_all{|i| i > 10}
end
puts firstPuzzle([3, 5, 1, 2, 7, 9, 8, 13, 25, 32])

# Second Puzzle*************************
def second(arr)
  arr.shuffle.each{|i| puts i}
  puts 'SPACE ************' #so i can tell the difference in the terminal
  return arr.find_all{|i| i.length > 5}
end
puts second(['John', 'KB', "Oliver", "Cory", 'Matthew', 'Christopher'])

# Third Puzzle*************************
def third(arr)
  puts arr.shuffle.at(arr.length-1)
  x = arr.shuffle.at(0)
  if x == 'a' || x == 'e' || x == 'i'|| x == 'o'|| x == 'u'
    puts x + ' was a vowel'
  else
    puts x
  end
end
third(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'z', 'w', 'x', 'y', 'z'])

# fourth puzzle*************************
arr = []
(55..100).each{|i| arr.push(i)}
answer = []
1.upto(10){|i| answer.push(arr.shuffle.at(0))}
puts answer

# fifth puzzle*************************
arr = []
(55..100).each{|i| arr.push(i)}
answer = []
1.upto(10){|i| answer.push(arr.shuffle.at(0))}
puts answer.sort
puts answer.max
puts answer.min

# sixth puzzle*************************
(65+rand(26)).chr # generates random character from A-Z
str = ''
1.upto(5){|i| str += (65+rand(26)).chr}
puts str

# seventh puzzle*************************
answer = []
for i in 1..10
  str = ''
  1.upto(5){|i| str += (65+rand(26)).chr}
  answer.push(str)
end
# puts answer
