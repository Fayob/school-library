require 'rspec'
require_relative '../book'

# add test for book
describe 'Test for Book Class' do
  it 'test the instance variable in Book Class' do
    new_book = Book.new('Ruby Tutorial', 'John')
    expect(new_book.title).to eql 'Ruby Tutorial'
    expect(new_book.author).to eql 'John'
  end
end
