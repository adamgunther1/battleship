##REMOVE EDGE CASE OF USER INPUT AS A1A2 INSTEAD OF A1 A2


require './lib/grid'
require './lib/communication'

class UserPlacement
  include Communication

  attr_reader :user_grid, :two_unit_first_coord, :two_unit_second_coord,
              :three_unit_first_coord, :three_unit_second_coord, 
              :three_unit_mid_coord

  def initialize
    @user_grid = Grid.new
    @two_unit_first_coord = two_unit_first_coord
    @two_unit_second_coord = two_unit_second_coord
    @three_unit_first_coord = three_unit_first_coord
    @three_unit_second_coord = three_unit_second_coord
    @three_unit_mid_coord = three_unit_mid_coord
  end

  def run
    prompt_user
    verify_two_unit_ship_placement
    verify_three_unit_ship_placement
  end

  def prompt_user
    prompt_user_two_ship_placement
  end

  def get_two_unit_ship_placement
    prompt_to_get_two_unit_ship_placement
    two_unit_placement = gets.chomp.upcase
    two_unit_coord_collection = two_unit_placement.split(' ')
    @two_unit_first_coord = two_unit_coord_collection[0]
    @two_unit_second_coord = two_unit_coord_collection[1]
    verify_acceptable_position
    return two_unit_coord_collection
  end

  def verify_two_unit_ship_placement
    get_two_unit_ship_placement.to_a.each do |word|
        verify_coordinate_in_grid = user_grid.all_coordinate_values.to_a.any? do |index|
          word == index
        end
        if verify_coordinate_in_grid == false
          prompt_incorrect_coordinates
          self.verify_two_unit_ship_placement
        end
    end
  end

  def verify_acceptable_position
    if two_unit_first_coord == "A1"
      if two_unit_second_coord != "A2" && two_unit_second_coord != "B1"
        invalid
      end
    elsif two_unit_first_coord == "A2"
      if two_unit_second_coord != "A1" && two_unit_second_coord != "A3" && two_unit_second_coord != "B2"
        invalid
      end
    elsif two_unit_first_coord == "A3"
      if two_unit_second_coord != "A2" && two_unit_second_coord != "A4" && two_unit_second_coord != "B3"
        invalid
      end
    elsif two_unit_first_coord == "A4"
      if two_unit_second_coord != "A3" && two_unit_second_coord != "B4"
        invalid
      end
    elsif two_unit_first_coord == "B1"
      if two_unit_second_coord != "A1" && two_unit_second_coord != "C1" && two_unit_second_coord != "B2"
        invalid
      end
    elsif two_unit_first_coord == "B2"
      if two_unit_second_coord != "A2" && two_unit_second_coord != "C2" && two_unit_second_coord != "B1" && two_unit_second_coord != "B3"
        invalid
      end
    elsif two_unit_first_coord == "B3"
      if two_unit_second_coord != "A3" && two_unit_second_coord != "C3" && two_unit_second_coord != "B2" && two_unit_second_coord != "B4"
        invalid
      end
    elsif two_unit_first_coord == "B4"
      if two_unit_second_coord != "A4" && two_unit_second_coord != "C4" && two_unit_second_coord != "B3"
        invalid
      end
    elsif two_unit_first_coord == "C1"
      if two_unit_second_coord != "C2" && two_unit_second_coord != "B1" && two_unit_second_coord != "D1"
        invalid
      end
    elsif two_unit_first_coord == "C2"
      if two_unit_second_coord != "C1" && two_unit_second_coord != "C3" && two_unit_second_coord != "B2" && two_unit_second_coord != "D2"
        invalid
      end
    elsif two_unit_first_coord == "C3"
      if two_unit_second_coord != "C4" && two_unit_second_coord != "C2" && two_unit_second_coord != "B3" && two_unit_second_coord != "D3"
        invalid
      end
    elsif two_unit_first_coord == "C4"
      if two_unit_second_coord != "B4" && two_unit_second_coord != "C3" && two_unit_second_coord != "D4"
        invalid
      end
    elsif two_unit_first_coord == "D1"
      if two_unit_second_coord != "D2" && two_unit_second_coord != "C1"
        invalid
      end
    elsif two_unit_first_coord == "D2"
      if two_unit_second_coord != "D1" && two_unit_second_coord != "D3" && two_unit_second_coord != "C2"
        invalid
      end
    elsif two_unit_first_coord == "D3"
      if two_unit_second_coord != "C3" && two_unit_second_coord != "D2" && two_unit_second_coord != "D4"
        invalid
      end
    elsif two_unit_first_coord == "D4"
      if two_unit_second_coord != "D3" && two_unit_second_coord != "C4"
        invalid
      end
    end
  end

  def invalid
    coordinates_not_acceptable_message
    verify_two_unit_ship_placement
  end

  def get_three_unit_ship_placement
    prompt_to_get_three_unit_ship_placement
    three_unit_placement = gets.chomp.upcase
    three_unit_coord_collection = three_unit_placement.split(' ')
    @three_unit_first_coord = three_unit_coord_collection[0]
    @three_unit_second_coord = three_unit_coord_collection[1]
    get_three_unit_ship_mid_coordinate
    return three_unit_coord_collection
  end

  def get_three_unit_ship_mid_coordinate
    if three_unit_first_coord == "A1" && three_unit_second_coord == "A3"
      @three_unit_mid_coord = "A2"
    elsif three_unit_first_coord == "A1" && three_unit_second_coord == "C1"
      @three_unit_mid_coord = "B1"
    elsif three_unit_first_coord == "A2" && three_unit_second_coord == "A4"
      @three_unit_mid_coord = "A3"
    elsif three_unit_first_coord == "A2" && three_unit_second_coord == "C2"
      @three_unit_mid_coord = "B2"
    elsif three_unit_first_coord == "A3" && three_unit_second_coord == "A1"
      @three_unit_mid_coord = "A2"
    elsif three_unit_first_coord == "A3" && three_unit_second_coord == "C3"
      @three_unit_mid_coord = "B3"
    elsif three_unit_first_coord == "A4" && three_unit_second_coord == "A2"
      @three_unit_mid_coord = "A3"
    elsif three_unit_first_coord == "A4" && three_unit_second_coord == "C4"
      @three_unit_mid_coord = "B4"
    elsif three_unit_first_coord == "B1" && three_unit_second_coord == "B3"
      @three_unit_mid_coord = "B2"
    elsif three_unit_first_coord == "B1" && three_unit_second_coord == "D1"
      @three_unit_mid_coord = "C1"
    elsif three_unit_first_coord == "B2" && three_unit_second_coord == "B4"
      @three_unit_mid_coord = "B3"
    elsif three_unit_first_coord == "B2" && three_unit_second_coord == "D2"
      @three_unit_mid_coord = "C2"
    elsif three_unit_first_coord == "B3" && three_unit_second_coord == "B1"
      @three_unit_mid_coord = "B2"
    elsif three_unit_first_coord == "B3" && three_unit_second_coord == "D3"
      @three_unit_mid_coord = "C3"
    elsif three_unit_first_coord == "B4" && three_unit_second_coord == "B2"
      @three_unit_mid_coord = "B3"
    elsif three_unit_first_coord == "B4" && three_unit_second_coord == "D4"
      @three_unit_mid_coord = "C4"
    elsif three_unit_first_coord == "C1" && three_unit_second_coord == "C3"
      @three_unit_mid_coord = "C2"
    elsif three_unit_first_coord == "C1" && three_unit_second_coord == "A1"
      @three_unit_mid_coord = "B1"
    elsif three_unit_first_coord == "C2" && three_unit_second_coord == "C4"
      @three_unit_mid_coord = "C3"
    elsif three_unit_first_coord == "C2" && three_unit_second_coord == "A2"
      @three_unit_mid_coord = "B2"
    elsif three_unit_first_coord == "C3" && three_unit_second_coord == "C1"
      @three_unit_mid_coord = "C2"
    elsif three_unit_first_coord == "C3" && three_unit_second_coord == "A3"
      @three_unit_mid_coord = "B3"
    elsif three_unit_first_coord == "C4" && three_unit_second_coord == "C2"
      @three_unit_mid_coord = "C3"
    elsif three_unit_first_coord == "C4" && three_unit_second_coord == "A4"
      @three_unit_mid_coord = "B4"
    elsif three_unit_first_coord == "D1" && three_unit_second_coord == "D3"
      @three_unit_mid_coord = "D2"
    elsif three_unit_first_coord == "D1" && three_unit_second_coord == "B1"
      @three_unit_mid_coord = "C1"
    elsif three_unit_first_coord == "D2" && three_unit_second_coord == "D4"
      @three_unit_mid_coord = "D3"
    elsif three_unit_first_coord == "D2" && three_unit_second_coord == "B2"
      @three_unit_mid_coord = "C2"
    elsif three_unit_first_coord == "D3" && three_unit_second_coord == "D1"
      @three_unit_mid_coord = "D2"
    elsif three_unit_first_coord == "D3" && three_unit_second_coord == "B3"
      @three_unit_mid_coord = "C3"
    elsif three_unit_first_coord == "D4" && three_unit_second_coord == "D2"
      @three_unit_mid_coord = "D3"
    elsif three_unit_first_coord == "D4" && three_unit_second_coord == "B4"
      @three_unit_mid_coord = "C4"
    else
      prompt_incorrect_ship_placement_or_position
      verify_three_unit_ship_placement
    end
  end

  def verify_three_unit_ship_placement
    get_three_unit_ship_placement.to_a.each do |word|
      verify_coordinate_in_grid = user_grid.all_coordinate_values.to_a.any? do |index|
        word
      end
      if verify_coordinate_in_grid == false
        prompt_incorrect_coordinates
        verify_three_unit_ship_placement
      end
    end
    assure_three_unit_ship_not_on_occupied_coordinate
  end

  def assure_three_unit_ship_not_on_occupied_coordinate
    if three_unit_first_coord == two_unit_first_coord || three_unit_first_coord == two_unit_second_coord
      prompt_overlapping_coordinates_error_message
      verify_three_unit_ship_placement
    elsif three_unit_second_coord == two_unit_first_coord || three_unit_second_coord == two_unit_second_coord
      prompt_overlapping_coordinates_error_message
      verify_three_unit_ship_placement
    elsif three_unit_mid_coord == two_unit_first_coord || three_unit_mid_coord == two_unit_second_coord
      prompt_overlapping_coordinates_error_message
      verify_three_unit_ship_placement
    end
  end

end