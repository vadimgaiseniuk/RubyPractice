require_relative 'ConsoleInput'
require_relative 'PersonRepository'

include ConsoleInput

person_repository = PersonRepository.new
person = Person.new('Vadim', 'Haiseniuk', 'AF1234567890', Date.new(2002, 11, 20))

person_repository.add_person(person)

first_name = get_name_input
last_name = get_name_input
inn = get_inn_input
birth_date = get_birth_date_input

person_2 = Person.new(first_name, last_name, inn, birth_date)
person_repository.add_person(person_2)

people_with_part_name = person_repository.get_person_by_part_name('iuk')
people_with_part_name.each { |p| puts p.valid? }

found_people = person_repository.get_by_birth_date_range(Date.new(2002, 1, 1), Date.new(2030, 11, 11))

person_repository.get_all.each  { |p| puts p.valid? }

#found_people.each { |p| puts p.valid? }