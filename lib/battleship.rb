require 'pry'
require 'pry-state'
require './lib/menu'

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
  end

end

new_game = Battleship.new
