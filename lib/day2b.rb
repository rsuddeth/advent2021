# frozen_string_literal: true

require 'pry'

instructions = File.readlines('JoDay2.txt')

horizontal_pos = 0
depth = 0
aim = 0

instructions.map do |line|
  instruction = line.split(' ')
  value = instruction[1].to_i
  case instruction[0]
  when 'forward'
    horizontal_pos += value
    depth += aim * value
  when 'down'
    aim += value
  when 'up'
    aim -= value
  end
end

puts horizontal_pos * depth

