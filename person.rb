class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(100..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return unless is_of_age? || @parent_permission

    true
  end

  private

  def is_of_age?
    @age >= 18
  end
end
