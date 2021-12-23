# frozen_string_literal: true

require 'pry'

instructions = File.readlines('JoDay2.txt')

horizontal_pos = 0
depth = 0

instructions.map do |line|
  instruction = line.split(' ')
  case instruction[0]
  when 'forward'
    horizontal_pos += instruction[1].to_i
  when 'down'
    depth += instruction[1].to_i
  when 'up'
    depth -= instruction[1].to_i
  end
end

puts horizontal_pos * depth

