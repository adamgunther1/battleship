require 'pry'
require 'pry-state'
require './lib/grid'

class UserPlacement
  attr_reader :user_grid, :two_unit_first_coord, :two_unit_second_coord,
              :three_unit_first_coord, :three_unit_second_coord, 
              :three_unit_mid_coord
  def initialize
    @user_grid = Grid.new
  end

  def prompt_user
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
  end

  def get_two_unit_ship_placement
    puts "Specify your two-unit placement like: 'A1 A2' or 'B3 C3'"
    puts "Enter the squares for the two-unit ship:"
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
          puts "Sorry the coordinates do not match the coordinates on the grid."
          self.verify_two_unit_ship_placement
        end
    end
  end

  def verify_acceptable_position
    if two_unit_first_coord == "A1"
      if two_unit_second_coord != "A2" && two_unit_second_coord != "B1"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "A2"
      if two_unit_second_coord != "A1" && two_unit_second_coord != "A3" && two_unit_second_coord != "B2"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "A3"
      if two_unit_second_coord != "A2" && two_unit_second_coord != "A4" && two_unit_second_coord != "B3"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "A4"
      if two_unit_second_coord != "A3" && two_unit_second_coord != "B4"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "B1"
      if two_unit_second_coord != "A1" && two_unit_second_coord != "C1" && two_unit_second_coord != "B2"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "B2"
      if two_unit_second_coord != "A2" && two_unit_second_coord != "C2" && two_unit_second_coord != "B1" && two_unit_second_coord != "B3"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "B3"
      if two_unit_second_coord != "A3" && two_unit_second_coord != "C3" && two_unit_second_coord != "B2" && two_unit_second_coord != "B4"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "B4"
      if two_unit_second_coord != "A4" && two_unit_second_coord != "C4" && two_unit_second_coord != "B3"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "C1"
      if two_unit_second_coord != "C2" && two_unit_second_coord != "B1" && two_unit_second_coord != "D1"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "C2"
      if two_unit_second_coord != "C1" && two_unit_second_coord != "C3" && two_unit_second_coord != "B2" && two_unit_second_coord != "D2"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "C3"
      if two_unit_second_coord != "C4" && two_unit_second_coord != "C2" && two_unit_second_coord != "B3" && two_unit_second_coord != "D3"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "C4"
      if two_unit_second_coord != "B4" && two_unit_second_coord != "C3" && two_unit_second_coord != "D4"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "D1"
      if two_unit_second_coord != "D2" && two_unit_second_coord != "C1"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "D2"
      if two_unit_second_coord != "D1" && two_unit_second_coord != "D3" && two_unit_second_coord != "C2"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "D3"
      if two_unit_second_coord != "C3" && two_unit_second_coord != "D2" && two_unit_second_coord != "D4"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    elsif two_unit_first_coord == "D4"
      if two_unit_second_coord != "D3" && two_unit_second_coord != "C4"
        puts "Sorry the position or size of your ship does not meet the requirements."
        verify_two_unit_ship_placement
      end
    end
  end


  def get_three_unit_ship_placement
    puts "Specify your three-unit placement like: 'A1 A3' or 'B2 D2'"
    puts "Enter the squares for the three-unit ship:"
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
      puts "Sorry the position or size of your ship does not meet the requirements."
      verify_three_unit_ship_placement
    end
  end

  def verify_three_unit_ship_placement
    get_three_unit_ship_placement.to_a.each do |word|
      verify_coordinate_in_grid = user_grid.all_coordinate_values.to_a.any? do |index|
        word
      end
      if verify_coordinate_in_grid == false
        puts "Sorry the coordinates do not match the coordinates on the grid."
        verify_three_unit_ship_placement
      end
    end
    assure_three_unit_ship_not_on_occupied_coordinate
  end

  def assure_three_unit_ship_not_on_occupied_coordinate
    if three_unit_first_coord == two_unit_first_coord || three_unit_first_coord == two_unit_second_coord
      puts "Sorry the coordinates overlap your two-unit ship"
      verify_three_unit_ship_placement
    elsif three_unit_second_coord == two_unit_first_coord || three_unit_second_coord == two_unit_second_coord
      puts "Sorry the coordinates overlap your two-unit ship"
      verify_three_unit_ship_placement
    elsif three_unit_mid_coord == two_unit_first_coord || three_unit_mid_coord == two_unit_second_coord
      puts "Sorry the coordinates overlap your two-unit ship"
      verify_three_unit_ship_placement
    end
  end

  def run
    prompt_user
    verify_two_unit_ship_placement
    verify_three_unit_ship_placement
  end
end