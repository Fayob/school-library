require 'rspec'
require_relative "../book"

describe "Test for Book Class" do
  it "test the instance variable in Book Class" do
    newBook = Book.new("Ruby Tutorial", "John")
    expect(newBook.title).to eql "Ruby Tutorial"
    expect(newBook.author).to eql "John"
  end
end