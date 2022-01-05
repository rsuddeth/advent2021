require 'rspec'
require_relative '../lib/coord_set'

describe 'CoordSet' do
  vert = '9,4 -> 3,4'
  horiz = '2,2 -> 2,1'
  vert_coords = CoordSet.new(vert)
  horiz_coords = CoordSet.new(horiz)

  vert_line = [[9,4],[8,4],[7,4],[6,4],[5,4],[4,4],[3,4]]
  horiz_line = [[2,2],[2,1]]

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
end
