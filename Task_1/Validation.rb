require 'date'

module Validation
  VALID_NAME_LENGTH = 40

  def valid_name?(name)
    return false if name.nil? || name.length > VALID_NAME_LENGTH

    name.match?(/^(?=.{1,30}$)(\p{Lu}\p{Ll}*(-\p{Lu}\p{Ll}*)*)$/)
  end

  def valid_inn?(inn)
    return false if inn.nil?

    inn.match?(/[a-zA-Z]{2}\d{10}\z/)
  end

  def valid_birth_date?(date)
    return false if date.nil?

    date <= Date.today
  end
end