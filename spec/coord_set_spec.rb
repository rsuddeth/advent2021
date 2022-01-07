require 'rspec'
require_relative '../lib/coord_set'

describe 'CoordSet' do
  vert = '9,4 -> 3,4'
  horiz = '2,2 -> 2,1'
  diag = '8,0 -> 0,8'
  diag2 = '6,4 -> 2,0'
  vert_coords = CoordSet.new(vert)
  horiz_coords = CoordSet.new(horiz)
  diag_coords = CoordSet.new(diag)
  diag_coords2 = CoordSet.new(diag2)

  vert_line = [[9,4],[8,4],[7,4],[6,4],[5,4],[4,4],[3,4]]
  horiz_line = [[2,2],[2,1]]
  diag_line = [[0,8],[1,7],[2,6],[3,5],[4,4],[5,3],[6,2],[7,1],[8,0]]
  diag_line2 = [[2,0],[3,1],[4,2],[5,3],[6,4]]

  it 'vert is_vertical' do
    expect(vert_coords.is_vertical)
  end

  it 'horiz !is_vertical' do
    expect(!horiz_coords.is_vertical)
  end

  it 'horiz is_horizontal' do
    expect(horiz_coords.is_horizontal)
  end

  it 'vert !is_horizontal' do
    expect(!vert_coords.is_horizontal)
  end

  it 'horizontal points' do
    expect(horiz_coords.all_line_points) =~ horiz_line
  end

  it 'vertical points' do
    expect(vert_coords.all_line_points) =~ vert_line
  end

  it 'diag is_diagonal' do
    expect(diag_coords.is_diagonal)
  end

  it 'diagonal points neg slope' do
    expect(diag_coords.all_line_points) =~ diag_line
  end

  it 'diagonal points pos slope' do
    expect(diag_coords2.all_line_points) =~ diag_line2
  end
end
