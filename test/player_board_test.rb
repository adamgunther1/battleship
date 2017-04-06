require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_board'

class PlayerBoardTest < Minitest::Test

  def test_exists
    play = PlayerBoard.new

    assert_instance_of PlayerBoard, play
  end

  def test_new_instance_of_grid
    play = PlayerBoard.new
    new_grid = play.player_board
    assert_instance_of Grid, new_grid
  end

  def test_prompt_player_to_fire
    play = PlayerBoard.new
    fire = play.fire
    
    assert_equal "Fire your shot by entering a coordinate you have not fired upon, i.e. 'A1'", fire
  end

  def test_validation_of_actual_coordinate
    play = PlayerBoard.new
    play_1 = PlayerBoard.new
    target = "A1"
    verify = play.verify_coord(target)
    target_1 = "A5"
    verify_1 = play_1.verify_coord(target_1)

    assert verify
    refute verify_1
  end

  def test_if_already_target_array_gets_target_shoveled
    play = PlayerBoard.new
    target = "A1"
    verify = play.verify_coord(target)

    assert play.already_targeted.length > 0
  end

  def test_if_already_fired_on_that_coordinate
    play = PlayerBoard.new
    play.already_targeted = ["A1", "A2"]
    target = "A1"
    verify = play.verify_coord(target)
    
    assert play.already_targeted.length == 2
  end

end