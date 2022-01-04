

class CoordSet
  def initialize(data)
    coord_pairs = data.split('->').map(&:strip)
    pair1 = coord_pairs[0].split(',')
    pair2 = coord_pairs[1].split(',')

    @x1 = pair1[0].to_i
    @y1 = pair1[1].to_i
    @x2 = pair2[0].to_i
    @y2 = pair2[1].to_i
  end

  def is_horizontal
    @y1 == @y2
  end

  def is_vertical
    @x1 == @x2
  end

  def all_line_points
    points = []
    if is_horizontal
      for x in @x1..@x2 do
        points << [x,@y1]
      end
    elsif is_vertical
      for y in @y1..@y2 do
        points << [@x1,y]
      end
    end
  end
end
