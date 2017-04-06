require './lib/computer_placement'
require './lib/user_placement'

class Menu

  def initialize
    run
  end

  def get_input
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    menu_selection = gets.chomp.downcase
    if menu_selection == "p" || menu_selection == "play"
      play
    elsif menu_selection == "i" || menu_selection == "instructions"
      instructions
    elsif menu_selection == "q" || menu_selection == "quit"
      quit
    else
      p "Sorry, did not understand."
      self.get_input
    end
  end

  def play
    computer_placement = ComputerPlacement.new
    user_placment = UserPlacement.new
  end

  def instructions
    puts "Battleship is a game for two player where you try to guess the location of two ships your opponent has hidden on a grid. Your opponent will be me, the computer. Players take turns calling out a row and column, such as 'A1', attempting to name a square containing enemy ships. Each player gets a board with with a 4x4 grid and two ships (a two-unit ship and a three-unit ship), and a bunch of hit and miss markers. Sink all of your opponent's ships by correctly guessing their location."
    puts "Setup: I will place my ships randomly and you will be prompted to place your ships. Select the starting coordinate and ending coordinate of your ship. For example: a two-unit ship can be placed on 'A1 A2' or 'A2 B2' and a three-unit ship can be placed on 'A1 A3' or 'B2 B4'. You must place your ships horizontally or vertically. They can't wrap around the grid or hand over the grid. Ships can touch but can't be on the same space."
    puts "Interface: The grid will start of blank and every coordinate you choose to attack will either display an 'H' for Hit or 'M' for Miss."
    get_instructions_input
  end

  def get_instructions_input
    puts "Would you like to (p)lay or (q)uit?"
    instructions_selection = gets.chomp.downcase
    if instructions_selection == "p" || instructions_selection == "play"
      play
    elsif instructions_selection == "q" || instructions_selection == "quit"
      quit
    else
      p "Sorry, did not understand."
      self.get_instructions_input
    end
  end

  def quit
    puts "You have quit the game."
    abort
  end

  def run
    get_input
  end

end
