require 'rspec'
require_relative '../base_decorator'

describe 'Test for Base Decorator Class' do
  it 'test correct_name method in BaseDecorator Class' do
    new_base_decorator = BaseDecorator.new('John')
    expect(new_base_decorator.correct_name).to eql 'John'
  end
end
