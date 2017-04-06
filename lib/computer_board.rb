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
    @two_unit_ship_location = [@two_unit_first_coord, @two_unit_second_coord]
    @three_unit_ship_location = [@three_unit_first_coord, @three_unit_second_coord, @three_unit_mid_coord]
    add_computer_ship_location
  end

  def display_computer_board
    p "COMPUTER BOARD"
    computer_board.display_grid
  end

  def add_computer_ship_location
    @two_unit_ship_location.each do |s|
      i = computer_board.all_coordinate_values.index(s)
      computer_board.all_coordinate_values[i] = "s "
    end
    @three_unit_ship_location.each do |s|
      i = computer_board.all_coordinate_values.index(s)
      computer_board.all_coordinate_values[i] = "S "
    end
  end

  def get_firing_target
    target = "M "
    until target != "H " && target != "M "
      target = computer_board.all_coordinate_values[rand(16)]
    end
    @shot_count += 1
    hit_or_miss(target)
    return target
  end

  def hit_or_miss(target)
    if target == "S " || target == "s "
      hit(target)
    else
      miss(target)
    end
  end
  
  def hit(target)
    i = computer_board.all_coordinate_values.index(target)
    computer_board.all_coordinate_values[i] = "H "
    if target == "s "
      @two_unit_ship_health -= 1
      if @two_unit_ship_health > 0
        p "Hit your ship!"
      elsif @two_unit_ship_health == 0
        p "Sunk your two-unit ship!"
      end
    elsif target == "S "
      @three_unit_ship_health -= 1
      if @three_unit_ship_health > 0
        p "Hit your ship!"
      elsif @three_unit_ship_health == 0
        p "Sunk your three-unit ship!"
      end
    end
    if @two_unit_ship_health == 0 && @three_unit_ship_health == 0
      p "I sunk your final ship!"
      p "GAME OVER"
      p "shot-count: #{shot_count}"
      @end_time = Time.now
      p "game-time: #{@end_time - @start_time} seconds"
    end
  end

  def miss(target)
    p "Miss!"
    i = computer_board.all_coordinate_values.index(target)
    computer_board.all_coordinate_values[i] = "M "
  end

end