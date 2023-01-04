require 'rspec'
require_relative '../teacher'

describe "test for Teacher Class" do
  it "should test for can_use_services? method in Teacher Class" do 
    newTeacher = Teacher.new(20, 'English', 'John', true)
    expect(newTeacher.can_use_services?).to eql(true)
  end
end