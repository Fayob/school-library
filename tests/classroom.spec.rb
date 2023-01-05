require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe 'test for Classroom Class' do
  it 'should test for add_student method in Classroom Class' do
    new_classroom = Classroom.new('elementary')
    student1 = Student.new(20, 'elementary', 'John', true)
    student2 = Student.new(20, 'secondary', 'James', true)
    student3 = Student.new(20, 'elementary', 'Peter', true)
    student4 = Student.new(20, 'secondary', 'Paul', true)
    new_classroom.add_student(student1)
    new_classroom.add_student(student2)
    new_classroom.add_student(student3)
    new_classroom.add_student(student4)
    expect(new_classroom.students.length).to eql 4
    expect(new_classroom.students[1]).to match student2
    expect(new_classroom.students[3]).to match student4
  end
end
