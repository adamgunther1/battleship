require 'pry'
require 'pry-state'
require './lib/grid'
require './lib/computer_placement'

class PlayerBoard
  attr_reader :computer_placement, :two_unit_first_coord, :two_unit_second_coord,
               :three_unit_first_coord, :three_unit_second_coord, :three_unit_mid_coord,
               :start_time, :end_time
  attr_accessor :player_board, :already_targeted, :two_unit_ship_health, :three_unit_ship_health,
                :shot_count

  def initialize
    @player_board = Grid.new
    @computer_placement = ComputerPlacement.new
    computer_placement.run
    @two_unit_first_coord = computer_placement.two_unit_first_coord
    @two_unit_second_coord = computer_placement.two_unit_second_coord
    @three_unit_first_coord = computer_placement.three_unit_first_coord
    @three_unit_second_coord = computer_placement.three_unit_second_coord
    @three_unit_mid_coord = computer_placement.three_unit_mid_coord
    @already_targeted = []
    @two_unit_ship_health = 2
    @three_unit_ship_health = 3
    @shot_count = 0
    @start_time = Time.now
    @end_time = end_time
  end

  def display_player_board
    player_board.display_grid
  end

  def fire
    p "Fire your shot by entering a coordinate you have not fired upon, i.e. 'A1'"
  end

  def get_firing_target
    fire
    target = gets.chomp.upcase
    verify_coord(target)
    @shot_count += 1
  end

  def verify_coord(target)
    verify_coordinate = player_board.coordinate_values_duplicate_check.to_a.any? do |index|
      target == index
    end
    if verify_coordinate == false
      puts "Sorry the coordinate you entered does not match the coordinates on the grid."
      return
    end
    check_for_duplicate = already_targeted.any? do |coord|
      target == coord
    end
    if check_for_duplicate == false
      @already_targeted << target
    elsif check_for_duplicate == true
      puts "Sorry you have already fired upon this target."
      return
    end
    hit_or_miss(target)
    return verify_coordinate
  end

  def hit_or_miss(target)
    if target == two_unit_first_coord || target == two_unit_second_coord || target == three_unit_first_coord || target == three_unit_second_coord || target == three_unit_mid_coord
      hit(target)
    else
      miss(target)
    end
  end

  def hit(target)
    i = player_board.all_coordinate_values.index(target)
    player_board.all_coordinate_values[i] = "H"
    if target == two_unit_first_coord || target == two_unit_second_coord
      @two_unit_ship_health -= 1
      if @two_unit_ship_health > 0
        p "Hit enemy ship!"
      elsif @two_unit_ship_health == 0
        p "Sunk my two-unit ship!"
      end
    elsif target == three_unit_first_coord || target == three_unit_second_coord || target == three_unit_mid_coord
      @three_unit_ship_health -= 1
      if @three_unit_ship_health > 0
        p "Hit enemy ship!"
      elsif @three_unit_ship_health == 0
        p "Sunk my three-unit ship!"
      end
    end
    if @two_unit_ship_health == 0 && @three_unit_ship_health == 0
      p "You sunk my final ship!"
      p "Congratulations!!!"
      p "shot-count: #{shot_count}"
      @end_time = Time.now
      p "game-time: #{@end_time - @start_time} seconds"
    end
  end

  def miss(target)
    p "Miss!"
    i = player_board.all_coordinate_values.index(target)
    player_board.all_coordinate_values[i] = "M"
  end

end

play = PlayerBoard.new
until play.two_unit_ship_health == 0 && play.three_unit_ship_health == 0
  play.display_player_board
  play.get_firing_target
end


