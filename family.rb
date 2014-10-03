require "application.rb"

class FamilyMember < Person
  def initialize(relationship)
    @relationship = relationship
    super
  end  
  
  def show_relationship
    return @relationship
  end
end