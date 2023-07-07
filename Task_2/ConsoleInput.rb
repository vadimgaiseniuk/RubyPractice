require_relative '../Task_1/Validation'

module ConsoleInput
  include Validation

  def get_string_input
    loop do
      print "Enter string input: "
      input = gets.chomp

      return input if input.is_a?(String)

      puts "Invalid string input"
      end
  end

  def get_int_input
    loop do
      print "Enter integer value: "
      input = gets.chomp

      return input.to_i if input.match?(/\A[-+]?\d+\z/)

      puts "Invalid integer input"
    end
  end

  def get_float_input
    loop do
      print "Enter float value: "
      input = gets.chomp

      return input.to_f if input.match?(/\A[-+]?\d+(\.\d+)?\z/)

      puts "Invalid float input"
    end
  end

  def get_date_input
    loop do
      print "Enter a date YYYY-MM-DD: "
      input = gets.chomp
      date = nil

      begin
        date = Date.parse(input)

      rescue ArgumentError
        puts "Invalid date input."
      end

      return date unless date.nil?

      end
    end

  def get_name_input
    loop do
      print "Enter name: "
      name = gets.chomp

      return name if valid_name?(name)

      puts "Invalid name input"
    end
  end

  def get_birth_date_input
    loop do
      print "Enter birth date: "
      birth_date = get_date_input

      return birth_date if valid_birth_date?(birth_date)

      puts "Invalid birth date"
    end
  end

  def get_inn_input
    loop do
      print "Enter INN value: "
      inn = gets.chomp

      return inn if valid_inn?(inn)

      puts "Invalid INN"
    end
  end

end