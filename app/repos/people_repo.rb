class PeopleRepo
  def all
    Person.alphabetical
  end

  def find(person_id)
    Person.friendly.find(person_id)
  end
end
