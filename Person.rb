require_relative "Validation"

class Person
  include Validation

  attr_accessor :name, :id, :birth_date

  def initialize(name, id, birth_date)
    @name = name
    @id = id
    @birth_date = birth_date
  end

  def valid?
    puts "\n"

    valid_name = Validation.valid_name?(@name)
    valid_id = Validation.valid_id?(@id)
    valid_birthdate = Validation.valid_date?(@birth_date)

    puts "Name: #{name} | Is valid: #{valid_name}"
    puts "ID: #{id} | Is valid: #{valid_id}"
    puts "Birthdate: #{birth_date} | Is valid: #{valid_birthdate}"

    valid_name && valid_id && valid_birthdate
  end
end