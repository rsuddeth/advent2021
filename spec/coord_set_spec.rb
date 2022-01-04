require 'rspec'
require_relative '../lib/coord_set'

describe 'CoordSet' do
  vert = '9,4 -> 3,4'
  horiz = '2,2 -> 2,1'

  it 'vert is_vertical' do
    expect(CoordSet.new(vert).is_vertical)
  end

  it 'horiz !is_vertical' do
    expect(!CoordSet.new(horiz).is_vertical)
  end

  it 'horiz is_horizontal' do
    expect(CoordSet.new(horiz).is_horizontal)
  end

  it 'vert !is_horizontal' do
    expect(!CoordSet.new(vert).is_horizontal)
  end
end
