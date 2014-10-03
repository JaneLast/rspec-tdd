# Requirements
require 'date'
require 'yaml'
require './addressbook.rb'
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
