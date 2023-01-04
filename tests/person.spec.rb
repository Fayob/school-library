require 'rspec'
require_relative '../person'

describe 'test for Person class' do
  it 'should test for all the methods in Person Class' do
    new_person = Person.new(20, 'Favour', true)
    expect(new_person.correct_name).to eql('Favour')
    expect(new_person.can_use_services?).to eql true
    expect(new_person.id).to_not be_nil
  end

  it 'should test for all the methods in another Person Class instance' do
    another_person = Person.new(12, 'George', false)
    expect(another_person.correct_name).to eql('George')
    expect(another_person.correct_name).to match(/george/i)
    expect(another_person.can_use_services?).to eql nil
  end
end
