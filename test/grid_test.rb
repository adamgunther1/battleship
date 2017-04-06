require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid'

class GridTest < Minitest::Test

  def test_it_exists
    grid = Grid.new

    assert_instance_of Grid, grid
  end

end