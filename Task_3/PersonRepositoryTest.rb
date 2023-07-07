require 'test/unit'
require_relative '../Task_2/PersonRepository'

class PersonRepositoryTest < Test::Unit::TestCase

  def setup
    @person_repository = PersonRepository.new

    @person_1 = Person.new('Joseph', 'Biden', 'ZZ1234567890', '1942-11-20')
    @person_2 = Person.new('Barak', 'Obama', 'QQ1234567890', '1961-08-04')
    @person_repository.add_person(@person_1)
    @person_repository.add_person(@person_2)

    @from_date = '1950-11-11'
    @to_date = '2000-10-10'
  end

  def test_get_person_by_inn
    person = @person_repository.get_person_by_inn(@person_1.inn)

    assert_equal(@person_1, person)
  end

  def test_get_person_by_inn_nonexistent
    person = @person_repository.get_person_by_inn('AA0987654321')

    assert_nil(person)
  end

  def test_get_person_by_part_name
    found_people = @person_repository.get_person_by_part_name('bi')

    assert_includes(found_people, @person_1)
  end

  def test_get_person_by_part_name_nonexistent
    found_people = @person_repository.get_person_by_part_name('tr')

    assert_not_includes(found_people, @person_1)
    assert_empty(found_people)
  end

  def test_get_all
    all_people = @person_repository.get_all

    assert_equal(@person_repository.people, all_people)
  end

  def test_add_valid_person
    valid_person = Person.new('Donald', 'Trump', 'BW1234567890', '1946-06-14')
    @person_repository.add_person(valid_person)

    assert_includes(@person_repository.people, valid_person)
  end

  def test_add_invalid_person
    invalid_person = 'invalid'

    assert_raise(ObjectNotOfPersonTypeError) { @person_repository.add_person(invalid_person) }
  end

  def test_add_existing_person
    assert_raise(PersonAlreadyExistsError) { @person_repository.add_person(@person_1) }
  end

  def test_remove_valid_person
    @person_repository.remove_person(@person_1)

    assert_not_includes(@person_repository.people, @person_1)
  end

  def test_remove_invalid_person
    invalid_person = 'invalid'

    assert_raise(ObjectNotOfPersonTypeError) { @person_repository.remove_person(invalid_person) }
  end

  def test_edit_person_by_inn_valid
    new_person = Person.new('Donald', 'Trump', 'BW1234567890', '1946-06-14')
    edited_person = @person_repository.edit_person_by_inn(@person_1.inn, new_person)

    assert_equal(new_person.first_name, edited_person.first_name)
    assert_equal(new_person.last_name, edited_person.last_name)
    assert_equal(new_person.inn, edited_person.inn)
    assert_equal(Date.parse(new_person.birth_date), edited_person.birth_date)
  end

  def test_edit_person_by_inn_invalid
    new_person = 'invalid'

    assert_raise(ObjectNotOfPersonTypeError) { @person_repository.edit_person_by_inn(@person_1.inn, new_person) }
  end

  def test_edit_person_by_inn_nonexisting
    new_person = Person.new('Donald', 'Trump', 'BW1234567890', '1946-06-14')

    assert_raise(PersonNotFoundError) { @person_repository.edit_person_by_inn(new_person.inn, new_person) }
  end

  def test_get_by_birth_date_range
    people_in_range = @person_repository.get_by_birth_date_range(@from_date, @to_date)

    assert_includes(people_in_range, @person_2)
  end

  def test_get_by_birth_date_range_from_nil
    people_in_range = @person_repository.get_by_birth_date_range(nil, @to_date)

    assert_equal(@person_repository.people, people_in_range)
  end

  def test_get_by_birth_date_range_to_nil
    people_in_range = @person_repository.get_by_birth_date_range(@from_date, nil)

    assert_includes(people_in_range, @person_2)
  end

  def test_get_by_birth_date_range_nil
    people_in_range = @person_repository.get_by_birth_date_range(nil, nil)

    assert_equal(@person_repository.people, people_in_range)
  end
end