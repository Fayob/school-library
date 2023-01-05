require 'rspec'
require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe 'Test for Rental Class' do
  it 'test the instance variable in Rental Class' do
    book = Book.new('Good Code', 'James Peter')
    person = Person.new(20, 'John', true)
    new_rental = Rental.new('04-01-2023', book, person)
    expect(new_rental.date).to eql '04-01-2023'
    expect(new_rental.book).to match book
    expect(new_rental.person).to equal person
  end
end
