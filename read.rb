require 'pry'
require 'yaml'

file = File.open('phone_book.yml')

data = YAML::load(file)

#file.each do |line|
 # puts line
#end

#File.open('names.txt', 'a') do |file|
 # file.write "\nDanny"
#end
binding.pry