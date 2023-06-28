require_relative "Validation"
require_relative "Person"

include Validation

person1 = Person.new("John Doe", "AZ1234567890", "1990-01-01")
person2 = Person.new("Jane Smith", "InvalidID", "2000-12-31")

puts "Person 1 Validation: #{person1.valid?}"
puts "Person 2 Validation: #{person2.valid?}"