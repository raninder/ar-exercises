require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Update the first store

@store1 = Store.find_by(id: 1)
@store2 = Store.find_by(id: 2)

@store1.update(name: 'BBQ')