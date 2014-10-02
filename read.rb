file = File.open('names.txt')

file.each do |line|
  puts line
end

File.open('names.txt', 'a') do |file|
  file.write "\nDanny"
end
