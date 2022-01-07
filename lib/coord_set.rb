

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

  def is_diagonal
    (get_slope).abs == 1
  end

  def get_slope
    (@y1 - @y2) / (@x1 - @x2)
  end

  def all_line_points
    points = []
    if is_horizontal
      for x in [@x1, @x2].min .. [@x1, @x2].max do
        points << [x,@y1]
      end
    elsif is_vertical
      for y in [@y1, @y2].min .. [@y1, @y2].max do
        points << [@x1,y]
      end
    elsif is_diagonal
      if get_slope > 0
        y = [@y1, @y2].min
        for x in [@x1, @x2].min .. [@x1, @x2].max do
          points << [x,y]
          y += 1
        end
      else
        y = [@y1, @y2].max
        for x in [@x1, @x2].min .. [@x1, @x2].max do
          points << [x,y]
          y -= 1
        end
      end
    end
    points
  end
end
