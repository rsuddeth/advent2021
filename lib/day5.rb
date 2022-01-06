require_relative 'coord_set'

class Day5

  def self.load_data(file)
    file_rows = File.readlines(file).map(&:strip)
    line_ends = []
    file_rows.each { |row| line_ends << CoordSet.new(row)}
    line_ends
  end

  def self.populate_grid(line_ends)
    grid = {}
    line_ends.each do |coordset|
      line_points = coordset.all_line_points

      line_points.each do |points|
        if !grid[points[1]]
          grid[points[1]] = {}
        end
        if !grid[points[1]][points[0]]
          grid[points[1]][points[0]] = 0
        end
        grid[points[1]][points[0]] += 1
      end
    end
    grid
  end

  def self.count_overlaps(grid)
    overlaps = 0
    grid.each_value do |val|
      val.each_value do |point|
        if point > 1
          overlaps += 1
        end
      end
    end
    overlaps
  end
end

dataset = Day5.load_data('../data/JoDay5.txt')
grid = Day5.populate_grid(dataset)
puts Day5.count_overlaps(grid)
