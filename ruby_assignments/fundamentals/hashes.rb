x = {:first => 'Jerrod', :last => 'Quintana'}
# x = {'first' => 'Jerrod', 'last' => 'Quintana'}

puts x[:first]
# puts x['first']

x.delete(:first)
puts 'no keys found' if x.empty?
puts 'found :last key' if x.has_key?(:last)
puts 'Quintana' if x.has_value?('Quintana')
x.delete(:last)
puts 'no keys found' if x.empty?
