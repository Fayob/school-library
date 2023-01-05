require 'rspec'
require_relative '../trimmer_decorator'

# add test for trimmer
describe 'Test for Trimmer Decorator Class' do
  it 'test correct_name method in TrimmerDecorator Class' do
    trimmer_decorator1 = TrimmerDecorator.new('John')
    trimmer_decorator2 = TrimmerDecorator.new('Arrizabalaga')
    expect(trimmer_decorator1.correct_name).to eql 'John'
    expect(trimmer_decorator2.correct_name).to eql 'Arrizabala'
  end
end
