require_relative "Validation"
require_relative "Person"

include Validation

person1 = Person.new("Anna", "AZ1234567890", "1990-01-01")
person2 = Person.new("Anna-Maria", "InvalidID", "2000-12-31")

puts "Person 1 Ruby_Practice: #{person1.valid?}"
puts "Person 2 Ruby_Practice: #{person2.valid?}"