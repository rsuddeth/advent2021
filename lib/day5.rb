require 'coord_set'

class Day5

  @grid = {}

  def self.load_data(file)
    file_rows = File.readlines(file).map(&:strip)
    line_ends = []
    file_rows.each { |row| line_ends << CoordSet.new(row)}
    line_ends
  end

  def self.populate_grid(line_ends)
    line_ends.each do |coordset|
      if line_points = coordset.all_line_points
        line_points.each do |points|
          if !@grid[points[1]]
            @grid[points[1]] = {}
          end
          if !@grid[points[1]][points[0]]
            @grid[points[1]][points[0]] = 0
          end
          @grid[points[1]][points[0]] += 1
        end
      end
    end
    @grid
  end

  def self.count_overlaps

  end
end
