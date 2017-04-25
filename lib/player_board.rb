require './lib/grid'
require './lib/computer_placement'
require './lib/communication'

class PlayerBoard
  include Communication
  
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
    display_player_board_title
    player_board.display_grid
  end

  def fire
    prompt_player_move
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
      prompt_incorrect_coordinates
      return
    end
    check_for_duplicate = already_targeted.any? do |coord|
      target == coord
    end
    if check_for_duplicate == false
      @already_targeted << target
    elsif check_for_duplicate == true
      prompt_already_fired_upon_target_message
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
    player_board.all_coordinate_values[i] = "H "
    if target == two_unit_first_coord || target == two_unit_second_coord
      @two_unit_ship_health -= 1
      if @two_unit_ship_health > 0
        prompt_hit_enemy_ship_message
      elsif @two_unit_ship_health == 0
        prompt_computer_message_to_player_sunk_two_unit_ship
      end
    elsif target == three_unit_first_coord || target == three_unit_second_coord || target == three_unit_mid_coord
      @three_unit_ship_health -= 1
      if @three_unit_ship_health > 0
        prompt_hit_enemy_ship_message
      elsif @three_unit_ship_health == 0
        prompt_computer_message_to_player_sunk_three_unit_ship
      end
    end
    if @two_unit_ship_health == 0 && @three_unit_ship_health == 0
      prompt_player_wins_message
      p "shot-count: #{shot_count}"
      @end_time = Time.now
      p "game-time: #{@end_time - @start_time} seconds"
      abort
    end
  end

  def miss(target)
    prompt_missed_target
    i = player_board.all_coordinate_values.index(target)
    player_board.all_coordinate_values[i] = "M "
  end

  def run
    until play.two_unit_ship_health == 0 && play.three_unit_ship_health == 0
      play.display_player_board
      play.get_firing_target
    end
  end

end