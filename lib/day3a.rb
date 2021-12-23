require 'pry'

input = File.readlines('JoDay3.txt').map(&:strip)

gamma = ''
epsilon = ''

for i in (0...input[0].size)
  zero = 0
  one = 0
  input.each do |line|
    if line[i] == '0'
      zero += 1
    else
      one += 1
    end
  end
  if zero > one
    gamma<< '0'
  else
    gamma << '1'
  end
end

puts 'gamma rate: ' + gamma

gamma.each_char do |dig|
  dig == '0' ? epsilon << '1' : epsilon << '0'
end

puts 'epsilon rate: ' + epsilon

puts gamma.to_i(2) * epsilon.to_i(2)

