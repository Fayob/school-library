require_relative './person'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'
require 'json'

class App
  def initialize
    @books = JSON.parse(File.read('book.json'), object_class: OpenStruct)
    @rentals = JSON.parse(File.read('rentals.json'), object_class: OpenStruct)
    @people = JSON.parse(File.read('people.json'), object_class: OpenStruct)
  end

  def list_books
    if @books.empty?
      puts 'Oops! No book is available for now, you can create one'
      return
    end
    @books.map do |book|
      books = Book.new(book[:title], book[:author])
      puts "Title: #{books.title}, Author: #{books.author}"
    end
  end

  def list_people
    if @people.empty?
      puts "Oops! No person's information found"
      return
    end
    @people.map do |person|
      if person[:class] == 'Student'
        student = Student.new(person[:age], person[:classroom], person[:name], person[:parent_permission], person[:id])
        puts "[#{student.class}] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
      else
        teacher = Teacher.new(person[:age], person[:classroom], person[:name], person[:parent_permission], person[:id])
        puts "[#{teacher.class}] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}"
      end
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
    id = rand(100..1000)
    Student.new(age, classroom, name, parent_permission, id)
    @people.push({ id: id, class: 'Student', name: name, age: age, classroom: classroom,
                   parent_permission: parent_permission })

    File.write('people.json', JSON.pretty_generate(@people))

    puts 'Student created successfully'
  end

  def create_teacher
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Specilization:'
    specialization = gets.chomp
    id = rand(100..1000)
    Teacher.new(age, specialization, name, true, id)
    @people.push({ id: id, class: 'Teacher', name: name, age: age, specialization: specialization })

    File.write('people.json', JSON.pretty_generate(@people))

    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    Book.new(title, author)
    @books.push({ title: title, author: author })

    File.write('book.json', JSON.pretty_generate(@books))

    puts 'Book created successfully'
  end

  def create_rental
    if @books.length.zero?
      puts 'No book record found'
    elsif @people.length.zero?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number:'
      @books.each_with_index do |book, index|
        puts "#{index.to_i + 1}) Book Title: #{book[:title]}, Author: #{book[:author]}"
      end
      rental_book = gets.chomp.to_i - 1
      puts 'Select a person from the following list by number:'
      @people.each_with_index do |person, index|
        puts "#{index.to_i + 1}) Name: #{person[:name]} Age: #{person[:age]} Id: #{person[:id]}"
      end
      rental_person = gets.chomp.to_i - 1
      puts 'Please enter the date:'
      date = gets.chomp

      @rentals.push({ date: date, book_title: @books[rental_book][:title], book_author: @books[rental_book][:author],
                      person_id: @people[rental_person][:id] })

      File.write('rentals.json', JSON.pretty_generate(@rentals))

      puts 'Rental created successfully'
    end
  end

  def list_rentals
    puts 'Pick id of person'
    @people.each { |i| puts "id: #{i[:id]}, Person: #{i[:name]}" }
    print 'ID of person: '
    person_id = gets.chomp
    @rentals.each do |i|
      if i[:person_id].to_i == person_id.to_i
        return puts "Date: #{i[:date]}, Book: '#{i[:book_title]}' by #{i[:book_author].upcase}"
      end
    end
  end
end
