require 'rspec'
require_relative '../trimmer_decorator'

describe "Test for Trimmer Decorator Class" do
  it "test correct_name method in TrimmerDecorator Class" do
    trimmerDecorator_1 = TrimmerDecorator.new("John")
    trimmerDecorator_2 = TrimmerDecorator.new("Arrizabalaga")
    expect(trimmerDecorator_1.correct_name).to eql "John"
    expect(trimmerDecorator_2.correct_name).to eql "Arrizabala"
  end
end