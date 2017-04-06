require 'pry'
require 'pry-state'
require './lib/grid'
require './lib/user_placement'

class ComputerBoard
  attr_reader :user_placement, :two_unit_first_coord, :two_unit_second_coord,
               :three_unit_first_coord, :three_unit_second_coord, :three_unit_mid_coord,
               :start_time, :end_time
  attr_accessor :computer_board, :already_targeted, :two_unit_ship_health, :three_unit_ship_health,
                :shot_count

  def initialize
    @computer_board = Grid.new
    @user_placement = UserPlacement.new
    user_placement.run
    @two_unit_first_coord = user_placement.two_unit_first_coord
    @two_unit_second_coord = user_placement.two_unit_second_coord
    @three_unit_first_coord = user_placement.three_unit_first_coord
    @three_unit_second_coord = user_placement.three_unit_second_coord
    @three_unit_mid_coord = user_placement.three_unit_mid_coord
    @already_targeted = []
    @two_unit_ship_health = 2
    @three_unit_ship_health = 3
    @shot_count = 0
    @start_time = Time.now
    @end_time = end_time
  end

  def display_computer_board
    computer_board.display_grid
  end

  def get_firing_target
    target = "S"
    until target != "S" && target != "H" && target != "M"
      target = computer_board.all_coordinate_values[rand(16)]
    end
    target
  end

  def hit_or_miss()
end