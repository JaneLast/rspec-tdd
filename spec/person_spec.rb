require 'spec_helper'
require 'date'

describe "The Person Class" do
  it "should store basic details" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")
    expected_date = Date.parse("1 Jan 1990")
    expect(person.dob).to eq(expected_date)
    expect(person.first_name).to eq("Joe")
    expect(person.surname).to eq("Bloggs")
    expect(person.fullname).to eq("Joe Bloggs")
  end
  
  it "should store emails" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")
    expect(person.email).to eq([])
    
    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"
    
    expect(person.email).to eq(["joe@foo.com", "joe.bloggs@work.com"])
  end
  
  it "should store phone numbers" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")
    expect(person.phone_numbers).to eq([])
    
    person.add_phone "07712345678"
    person.add_phone "02012345678"
    
    expect(person.phone_numbers).to eq(["07712345678", "02012345678"])
  end
  
  it "should remove email" do
     person = Person.new("joe", "bloggs", "1 Jan 1990")
     person.add_email "joe@foo.com"
     person.add_email "joe.bloggs@work.com"
     
     person.remove_email(0)
     expect(person.email).to eq(["joe.bloggs@work.com"])
     
  end
  it "should output a summary string" do
     person = Person.new("joe", "bloggs", "1 Jan 1990")
     person.add_email "joe@foo.com"
     person.add_phone "07712345678"
     
     expect(person.to_s).to eq("Joe Bloggs was born on 1990-01-01. \n Their email addresses are: [\"joe@foo.com\"]. \n Their phone numbers are [\"07712345678\"]")
  end

  #it "should output a pretty display" do
   #  person = Person.new("joe", "bloggs", "1 Jan 1990")
    # person.add_email "joe@foo.com"
     #person.add_email "joe.bloggs@work.com"
     #person.add_phone "07712345678"
     
     #expect(person.print_details).to eq()
 # end
  
  it "make addressbook and someone" do
    person= Person.new("joe", "blogs", "1 Jan 1990")
    book = AddressBook.new
    book.add person
  end
  
  it "remove an entry from addressbook where equal name" do
    person= Person.new("joe", "blogs", "1 Jan 1990")
    book= AddressBook.new
    
    book.add person 
    book.remove("Joe")
    expect(book.people).to eq([])
  end
  
  it "should add add yml file into address book" do
    book = AddressBook.new
    book.yml_read
    
    expect(book.people.length).to eq(book.data[:people].length)
  end
end







