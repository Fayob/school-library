require 'rspec'
require_relative '../capitalize_decorator'

describe "Test for Capitalize Decorator Class" do
  it "test correct_name method in CapitalizeDecorator Class" do
    newCapitalizeDecorator = CapitalizeDecorator.new("John")
    expect(newCapitalizeDecorator.correct_name).to eql "JOHN"
  end
end