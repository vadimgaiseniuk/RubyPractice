require_relative "Validation"

class Person
  include Validation

  attr_reader :first_name, :last_name, :inn, :birth_date

  def initialize(first_name, last_name, inn, birth_date)
    @first_name = first_name
    @last_name = last_name
    @inn = inn
    @birth_date = birth_date
  end

  def first_name=(new_first_name)
    if valid_name?(new_first_name)
      @first_name = new_first_name
    else
      raise ArgumentError, "Invalid first name."
    end
  end

  def last_name=(new_last_name)
    if valid_name?(new_last_name)
      @last_name = new_last_name
    else
      raise ArgumentError, "Invalid last name."
    end
  end

  def inn=(new_inn)
    if valid_inn?(new_inn)
      @inn = new_inn
    else
      raise ArgumentError, "Invalid INN."
    end
  end

  def birth_date=(new_birth_date)
    if valid_birth_date?(new_birth_date)
      @birth_date = Date.parse(new_birth_date)
    else
      raise ArgumentError, "Invalid birth date."
    end
  end

  def valid?
    puts "\n"

    valid_first_name = valid_name?(@first_name)
    valid_last_name = valid_name?(@last_name)
    valid_inn = valid_inn?(@inn)
    valid_birthdate = valid_birth_date?(@birth_date)

    puts "First name: #{@first_name} | Is valid: #{valid_first_name}"
    puts "Last name: #{@last_name} | Is valid: #{valid_last_name}"
    puts "INN: #{@inn} | Is valid: #{valid_inn}"
    puts "Birthdate: #{@birth_date} | Is valid: #{valid_birthdate}"

    puts "Is valid: #{valid_first_name && valid_last_name && valid_inn && valid_birthdate}"
  end
end