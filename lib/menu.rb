require './lib/computer_placement'
require './lib/user_placement'
require './lib/communication'

class Menu
  include Communication

  def initialize
    run
  end

  def get_input
    display_menu_options
    menu_selection = gets.chomp.downcase
    if menu_selection == "p" || menu_selection == "play"
      play
    elsif menu_selection == "i" || menu_selection == "instructions"
      instructions
    elsif menu_selection == "q" || menu_selection == "quit"
      quit
    else
      display_incorrect_menu_selection
      self.get_input
    end
  end

  def play
    computer_placement = ComputerPlacement.new
    user_placment = UserPlacement.new
  end

  def instructions
    display_gameplay_instructions
    get_instructions_input
  end

  def get_instructions_input
    display_menu_options_from_instructions
    instructions_selection = gets.chomp.downcase
    if instructions_selection == "p" || instructions_selection == "play"
      play
    elsif instructions_selection == "q" || instructions_selection == "quit"
      quit
    else
      display_incorrect_menu_selection
      self.get_instructions_input
    end
  end

  def quit
    display_player_quit_the_game_message
    abort
  end

  def run
    get_input
  end

end
