require 'rspec'
require_relative '../lib/day6'

describe 'Day6' do
  fish_arr = Day6.load_data('data/day6example.txt')
  
  it 'data load results in 5 initial fish' do
    expect(fish_arr.size).to eq(5)
  end
end
