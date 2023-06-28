require 'date'

module Validation
  VALID_NAME_LENGTH = 40

  def self.valid_name?(name)
    return false if name.nil? || name.length > VALID_NAME_LENGTH

    name.match?(/\A[A-Za-z\s]+\z/)
  end

  def self.valid_id?(id)
    return false if id.nil?

    id.match?(/^[A-Z]{2}\d{10}$/)
  end

  def self.valid_date?(date)
    return false if date.nil?

    date_obj = Date.parse(date)
    date_obj < Date.today
  end
end