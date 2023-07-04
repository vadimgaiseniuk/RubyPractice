class PersonAlreadyExistsError < StandardError
  def initialize(inn)
    super("Person with INN #{inn} already exists.")
  end
end

class PersonNotFoundError < StandardError
  def initialize(inn)
    super("Person with INN #{inn} cannot be found.")
  end
end