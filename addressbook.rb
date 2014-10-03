require "application.rb"
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
  
  def search 
  end
end
