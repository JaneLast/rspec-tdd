require 'date'
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
  
end
