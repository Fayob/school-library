require 'rspec'
require_relative '../student'

describe 'test for Student Class' do
  it 'should test for classroom method in Student Class' do
    new_student = Student.new(20, 'elementary', 'John', true)
    expect(new_student.classroom).to eql('elementary')
  end

  it 'should test for play_hooky method in Student Class' do
    new_student = Student.new(12, 'secondary', 'George', false)
    expect(new_student.play_hooky).to eql('¯(ツ)/¯')
  end
end
