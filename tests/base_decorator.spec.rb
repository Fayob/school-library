require 'rspec'
require_relative '../base_decorator'

describe "Test for Base Decorator Class" do
  it "test correct_name method in BaseDecorator Class" do
    newBaseDecorator = BaseDecorator.new("John")
    expect(newBaseDecorator.correct_name).to eql "John"
  end
end