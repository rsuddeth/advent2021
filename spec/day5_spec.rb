require 'rspec'
require_relative '../lib/day5'

describe 'Day5' do
  context 'part 1' do
    dataset = Day5.load_data('data/day5example.txt')
    grid = Day5.populate_grid(dataset)

    it 'loads 10 sets of points' do
      expect(dataset.size).to eq(10)
    end

    it 'a set of points is an instance of CoordSet' do
      expect(dataset[0].class).to eq(CoordSet)
    end

    it 'populates grid' do
      expect(grid)
    end

    it 'lines overlap at 12 points' do
      expect(Day5.count_overlaps(grid)).to eq(12)
    end
  end
end
