require 'spec_helper'

describe "The Address Class" do  
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