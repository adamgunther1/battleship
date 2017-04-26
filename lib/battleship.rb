require './lib/menu'
require './lib/computer_placement'
require './lib/user_placement'
require './lib/computer_board'
require './lib/player_board'
require './lib/communication'

class Battleship
  include Communication

  def initialize
    run
  end
  
  def welcome_message
    display_game_welcome_message
  end

  def main_menu
    menu = Menu.new
  end

  def run
    welcome_message
    main_menu
    setup_turns
  end

  def setup_turns
    user = PlayerBoard.new
    comp = ComputerBoard.new
    until (comp.two_unit_ship_health == 0 && comp.three_unit_ship_health == 0) || (user.two_unit_ship_health == 0 && user.three_unit_ship_health == 0)
      user.display_player_board
      user.get_firing_target
      user.display_player_board
      prompt_next_turn_action
      continue = gets
      system "clear"
      comp.get_firing_target
      comp.display_computer_board
    end
  end

end

new_game = Battleship.new
new_game.run