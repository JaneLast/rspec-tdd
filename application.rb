# Requirements
require 'date'
require 'yaml'

# Person class it requires user to input first name, surname and dob
class Person
  
  attr_accessor :dob, :first_name, :surname, :email, :phone_numbers
  
  def initialize(fname, surname, dob)
    @dob = Date.parse(dob)
    @first_name = fname.capitalize
    @surname = surname.capitalize
    @email = []
    @phone_numbers = []
  end
    
# Fullname adds first name and last name together with a space
  def fullname
    "#{@first_name} #{@surname}"
  end
  
# add_email adds the user input email into the array  
  def add_email(e)
    email.push e
  end
  
# add_phone adds the user input phone into the array    
  def add_phone(p)
    phone_numbers.push p
  end
  
# remove_email removes the email from the array
  def remove_email(e)
      email.delete_at e
  end

# changes to_s to show a message rather than convert to string  
  def to_s
    "#{fullname} was born on #{dob}. \n Their email addresses are: #{email}. \n Their phone numbers are #{phone_numbers}"
  end   
end 

# AddressBook class that reads in yml file or user input and stores it
class AddressBook
  
  def initialize
    @book= []
    @data
  end

# Adds an input into the array
  def add(fname)
     @book << fname
  end

# Removes an input from the array  
  def remove(fname)
    @book.each do |p|
      if p.first_name == fname
        @book.delete(p)
      end
    end
  end

# Returns the AddressBook contents  
  def people
    return @book
  end

# Reads in a yml file, creates a person from the data in file and has the option to add the email or phone number if there are any 
  def yml_read
    file = File.open('phone_book.yml')
    @data = YAML::load(file)
    
    #Creates a new person object with the details form the yaml.
    @data[:people].each do |yaml_person|
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
  # Returns the data contents
  def data
    return @data
  end
end

class FamilyMember < Person
  def initialize(relationship)
    @relationship = relationship
    super
  end  
end