require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name, parent_permission, id)
    @specialization = specialization
    super(age, name, parent_permission, id)
  end

  def can_use_services?
    true
  end
end
