require 'coord_set'

class Day5

  def self.load_data(file)
    file_rows = File.readlines(file).map(&:strip)
    line_coords = []
    file_rows.each { |row| line_coords << CoordSet.new(row)}
    line_coords
  end

  def self.populate_grid(line_coords)

  end

  def self.count_overlaps

  end
end
