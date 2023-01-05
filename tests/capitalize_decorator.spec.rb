require 'rspec'
require_relative '../capitalize_decorator'

# add test for capitalize decorator
describe 'Test for Capitalize Decorator Class' do
  it 'test correct_name method in CapitalizeDecorator Class' do
    new_capitalize_decorator = CapitalizeDecorator.new('John')
    expect(new_capitalize_decorator.correct_name).to eql 'JOHN'
  end
end
