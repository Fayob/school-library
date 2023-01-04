require 'rspec'
require_relative '../student'

describe "test for Student Class" do
  it "should test for classroom method in Student Class" do 
    newStudent = Student.new(20, 'elementary', 'John', true)
    expect(newStudent.classroom).to eql("elementary")
  end

  it "should test for play_hooky method in Student Class" do 
    newStudent = Student.new(12, 'secondary', 'George', false)
    expect(newStudent.play_hooky).to eql("¯(ツ)/¯")
  end
end