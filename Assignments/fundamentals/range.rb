x = (1..10)
puts 'Class is: ' + x.class.to_s
puts 'It does contain 4!' if x.include? 4
puts 'It has 3 too! ' if x.member? 3
puts 'Last number of range is ' + x.last.to_s
puts 'Max is ' + x.max.to_s
puts 'Min is ' + x.min.to_s
