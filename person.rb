require_relative 'nameable'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name, parent_permission, id = rand(100..1000))
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return unless is_of_age? || @parent_permission

    true
  end

  def correct_name
    @name
  end

  private

  def is_of_age?
    @age >= 18
  end
end
