require 'rspec'
require_relative '../teacher'

describe 'test for Teacher Class' do
  it 'should test for can_use_services? method in Teacher Class' do
    new_teacher = Teacher.new(20, 'English', 'John', true)
    expect(new_teacher.can_use_services?).to eql(true)
  end
end
