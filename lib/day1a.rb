# frozen_string_literal: true

require 'pry'

depths = File.readlines('RaulDay1.txt').map(&:to_i)

total_increases = 0

for i in (1...depths.length)
  if depths[i] > depths[i-1]
    total_increases += 1
  end
end

puts total_increases
