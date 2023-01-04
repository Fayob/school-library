require_relative './person'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    if @books.empty?
      puts 'Oops! No book is available for now'
      return
    end
    @books.map do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts "Oops! No person's information found"
      return
    end
    @people.map do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp
    case input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Wrong input!'
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    end

    print 'Classroom: '
    classroom = gets.chomp

    student = Student.new(age, classroom, name, parent_permission)
    @people.push(student)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Specilization:'
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name, true)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number:'
      @books.each_with_index do |book, index|
        puts "#{index.to_i + 1}) Book Title: #{book.title}, Author: #{book.author}"
      end
      rental_book = gets.chomp.to_i - 1
      puts 'Select a person from the following list by number:'
      @people.each_with_index do |person, index|
        puts "#{index.to_i + 1}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i - 1
      puts 'Please enter the date:'
      date = gets.chomp
      rental_detail = Rental.new(date, @books[rental_book], @people[rental_person])
      @rentals.push(rental_detail)
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    puts 'Pick id of person'
    @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
    print 'ID of person: '
    person_id = gets.chomp
    @rentals.each do |i|
      puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
    end
  end
end
