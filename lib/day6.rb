

class Day6
  def self.load_data(file)
    raw = File.read(file)
    raw.split(',').map(&:strip)
  end
end
