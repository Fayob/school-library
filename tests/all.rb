Dir["#{File.dirname(File.absolute_path(__FILE__))}/**/*.spec.rb"].sort.each { |file| require file }
