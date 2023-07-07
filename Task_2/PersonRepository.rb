require_relative '../Task_1/Person'
require_relative 'custom_errors'

class PersonRepository
  MIN_DATE = '1-01-01'
  MAX_DATE = Date.today.to_s

  attr_reader :people

  def initialize(people = [])
    @people = people
  end

  def add_person(person)
    valid_person?(person)

    person_already_exists = @people.find { |found_person| found_person.inn == person.inn}

    if person_already_exists
      raise PersonAlreadyExistsError.new(person.inn)
    end

    @people << person
  end

  def remove_person(person)
    valid_person?(person)

    person_to_remove = get_person_by_inn(person.inn)

    if person_to_remove.nil?
      raise PersonNotFoundError.new(person.inn)
    end

    @people.delete(person_to_remove)
  end

  def edit_person_by_inn(inn, new_person)
    valid_person?(new_person)

    person_to_edit = get_person_by_inn(inn)

    if person_to_edit.nil?
      raise PersonNotFoundError.new(inn)
    end

    person_to_edit.first_name = new_person.first_name
    person_to_edit.last_name = new_person.last_name
    person_to_edit.inn = new_person.inn
    person_to_edit.birth_date = new_person.birth_date

    person_to_edit
  end

  def get_person_by_inn(inn)
    @people.find { |person| person.inn == inn }
  end

  def get_all
    @people
  end

  def get_person_by_part_name(part_name)
    part_name = part_name.downcase

    @people.select do |person| person.first_name.downcase.include?(part_name) ||
      person.last_name.downcase.include?(part_name)
    end
  end

  def get_by_birth_date_range(from_date = nil, to_date = nil)
    return get_all if from_date.nil? && to_date.nil?

    if from_date.nil?
      from_date = MIN_DATE
    end
    if to_date.nil?
      to_date = MAX_DATE
    end

    @people.select { |person| person.birth_date >= from_date && person.birth_date <= to_date}
  end

  def valid_person?(person)
    raise ObjectNotOfPersonTypeError unless person.is_a?(Person)
  end

end