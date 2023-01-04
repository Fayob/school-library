require 'rspec'
require_relative '../person'

describe "test for Person class" do
  it "should test for all the methods in Person Class" do 
    newPerson = Person.new(20, 'Favour', true)
    expect(newPerson.correct_name).to eql("Favour")
    expect(newPerson.can_use_services?).to eql true
    expect(newPerson.id).to_not be_nil
  end

  it "should test for all the methods in another Person Class instance" do 
    anotherPerson = Person.new(12, 'George', false)
    expect(anotherPerson.correct_name).to eql("George")
    expect(anotherPerson.correct_name).to match(/george/i)
    expect(anotherPerson.can_use_services?).to eql nil
  end
end