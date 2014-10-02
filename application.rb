require 'date'
require 'yaml'
require 'pry'
class Person
  
  attr_accessor :dob, :first_name, :surname, :email, :phone_numbers
  
  def initialize(fname, surname, dob)
    @dob = Date.parse(dob)
    @first_name = fname.capitalize
    @surname = surname.capitalize
    @email = []
    @phone_numbers = []
  end
    

  def fullname
    "#{@first_name} #{@surname}"
  end
  
  def add_email(e)
    email.push e
  end
  
  def add_phone(p)
    phone_numbers.push p
  end
  
  def remove_email(e)
      email.delete_at e
  end
  
  def to_s
    "#{fullname} was born on #{dob}. \n Their email addresses are: #{email}. \n Their phone numbers are #{phone_numbers}"
  end   
end 

class AddressBook
  def initialize
    @book= []
  end
  
  def add(p)
     @book.push p
  end
  
  def remove(fname)
    @book.each do |p|
      if p.first_name == fname
        @book.delete(p)
      end
    end
  end
  
  def people
    return @book
  end
  
  def yml_read
    file = File.open('phone_book.yml')
    data = YAML::load(file)
    
    data[:people].each do |yaml_person|
      #Creates a new person object with the details form the yaml.
      person = Person.new(yaml_person[:fname], yaml_person[:surname], yaml_person[:dob])
      
      # Add any email address
      yaml_person[:emails].each do |e|
        person.add_email(e)
      end
      
      # Add any phone numbers
      yaml_person[:phones].each do |e|
        person.add_phone(e)
      end
      
      # Save the new person 
      @book << person
      end
  end
  
  def data
    @data
  end
end

binding.pry