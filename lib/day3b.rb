require 'pry'

def find_oxygen(input, pos=0)
  if pos + 1 > input[0].size or input.size == 1
    input
  else
    com_dig = find_most_common(input, pos)
    new_array = keep_elements(input, com_dig, pos)
    find_oxygen(new_array, pos + 1)
  end
end

def find_co2(input, pos=0)
  if pos + 1 > input[0].size or input.size == 1
    input
  else
    com_dig = find_least_common(input, pos)
    new_array = keep_elements(input, com_dig, pos)
    find_co2(new_array, pos + 1)
  end
end

def keep_elements(input, dig, pos)
  new_arr = []
  input.each do |val|
    if val[pos] == dig
      new_arr << val
    end
  end
  new_arr
end

def find_most_common(input, pos)
  zero = 0
  one = 0
  input.each do |line|
    if line[pos] == '0'
      zero += 1
    else
      one += 1
    end
  end
  if zero > one
    '0'
  else
    '1'
  end
end

def find_least_common(input, pos)
  zero = 0
  one = 0
  input.each do |line|
    if line[pos] == '1'
      one += 1
    else
      zero += 1
    end
  end
  if one < zero
    '1'
  else
    '0'
  end
end

input = File.readlines('JoDay3.txt').map(&:strip)

oxygen = find_oxygen(input)

co2 = find_co2(input)

answer = oxygen[0].to_i(2) * co2[0].to_i(2)

puts "oxygen: #{oxygen}\nco2: #{co2}\nanswer: #{answer}"
