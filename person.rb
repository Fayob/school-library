class Person

  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = rand(100..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    end
  end

  private

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end
  
end