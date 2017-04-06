require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board'

class ComputerBoardTest < Minitest::Test

  def test_it_exists
    play = ComputerBoard.new

    assert_instance_of ComputerBoard, play
  end

  def test_get_firing_target
    play = ComputerBoard.new
    target = play.get_firing_target
    actual_target = play.computer_board.coordinate_values_duplicate_check.any? do |coord|
      target == coord
    end

    assert actual_target
  end

end