require 'pry'
require 'pry-state'
require './lib/menu'
require './lib/computer_placement'
require './lib/user_placement'
require './lib/computer_board'
require './lib/player_board'


class Battleship

  def initialize
    run
  end
  
  def welcome_message
    puts "Welcome to BATTLESHIP"
  end

  def main_menu
    menu = Menu.new
  end

  def run
    welcome_message
    main_menu
    ComputerPlacement.new.run
    UserPlacement.new.run
  end

end

new_game = Battleship.new
