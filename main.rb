require './app'

class Main
  def self.menu
    puts 'Welcome to School Library'
    puts
    puts 'Please choose an option by entering a number: '

    @list = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }

    @list.each do |index, string|
      puts "#{index} - #{string}"
    end

    Integer(gets.chomp)
  end

  read = App.new
  loop do
    case menu
    when 1
      read.list_books
    when 2
      read.list_people
    when 3
      read.create_person
    when 4
      read.create_book
    when 5
      read.create_rental
    when 6
      read.list_rentals
    when 7
      puts 'Thanks for using our library, have a great day ahead'
      exit
    else
      puts 'Please choose a number between 1 and 7.'
    end
  end
end

def main
  Main.new
end

main
