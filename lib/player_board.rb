require 'pry'
require 'pry-state'
require './lib/grid'
require './lib/user_placement'

class PlayerBoard
  attr_accessor :player_board, :target, :already_targeted

  def initialize
    @player_board = Grid.new
    @already_targeted = []
  end

  def display_player_board
    player_board.display_grid
  end

  def fire
    p "Fire your shot by entering a coordinate you have not fired upon, i.e. 'A1'"
  end

  def get_firing_target
    @target = gets.chomp.upcase
  end

  def verify_coord(target)
    verify_coordinate = player_board.all_coordinate_values.to_a.any? do |index|
      target == index
    end
    if verify_coordinate == false
      puts "Sorry the coordinate you entered does not match the coordinates on the grid."
        fire#self.fire
    end
    check_for_duplicate = already_targeted.any? do |coord|
      coord == target
    end
    if check_for_duplicate == false
      @already_targeted << target
    elsif check_for_duplicate == true
      puts "Sorry you have already fired upon this target."
      fire
    end
    
    return verify_coordinate
  end



end