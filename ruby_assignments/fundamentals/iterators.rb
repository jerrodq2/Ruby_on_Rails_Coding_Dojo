arr = ['one', 'two', 'three']
# all array methods are as follows: .method {|obj| block}
# .any? # returns true or false
arr.any? {|i| i == 'one'} #true, one of the values/iterations/i is equal to 'one'
arr.any? {|i| i == 'onee'} # false

# .each # calls block once for each element in self, passing that element as a parameter
arr.each{|i| puts i}

# .collect # returns new array with the results of running block once for every element in enum
x = arr.collect{|i| i + ' eh'}
# .map # exactly like collect
puts x
# .detect/.find # returns the first for which block is true (not false)
arr.detect{|i| i == 'two'}

# .find_all/.select # returns an array containg all elements for which the block is true
a = arr.find_all{|i| i == 'one'}

# .reject # opposite of find_all

# .upto(limit) # iterates block up to the int number
0.upto(2) {|i| puts i}


#.has_key?(key) # true or false

#.has_value?(value) # true or false

#.key(value) # returns the key of an occurence of a given value, if not found, returns nil

#.keys # returns a new array populated wiht the keys from the has.
