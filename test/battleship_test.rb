require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test

  def test_it_exists
    game = Battleship.new

    assert_instance_of Battleship, game
  end

  def test_initialize_returns_welcome_message
    game = Battleship.new
    message = game.welcome_message
    assert_equal "Welcome to BATTLESHIP", message
  end

  def test_main_menu_offers_options_and_instructions
    game = Battleship.new
    instructions = game.main_menu
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", instructions
  end

  def test_player_and_computer_takes_turns
    game = Battleship.new

  end
  
end