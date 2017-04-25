require 'pry'
require './lib/grid'

class ComputerPlacement
  attr_reader :computer_grid, :two_unit_first_coord, :two_unit_second_coord,
              :three_unit_first_coord, :three_unit_second_coord, :three_unit_mid_coord,
              :verification
              
  def initialize
    @computer_grid = Grid.new
    @two_unit_first_coord = two_unit_first_coord
    @two_unit_second_coord = two_unit_second_coord
    @three_unit_first_coord = three_unit_first_coord
    @three_unit_second_coord = three_unit_second_coord
    @three_unit_mid_coord = three_unit_mid_coord
    @verification = false
  end

  def run
    until @verification == true
      two_unit_ship_runner
      three_unit_ship_runner
    end
  end

  def two_unit_ship_runner
    two_unit_ship_first_coord
    two_unit_ship_second_coord
  end

  def three_unit_ship_runner
    three_unit_ship_first_coord
    three_unit_ship_second_coord
    three_unit_ship_mid_coord
    assure_three_unit_ship_not_on_occupied_coordinate
  end

  def two_unit_ship_first_coord
    @two_unit_first_coord = computer_grid.coordinates[rand(4)][rand(4)]
  end

  def two_unit_ship_second_coord
    if two_unit_first_coord == "A1"
      @two_unit_second_coord = ["A2", "B1"].sample
    elsif two_unit_first_coord == "A2"
      @two_unit_second_coord = ["A1", "A3", "B2"].sample
    elsif two_unit_first_coord == "A3"
      @two_unit_second_coord = ["A2", "A4", "B3"].sample
    elsif two_unit_first_coord == "A4"
      @two_unit_second_coord = ["A3", "B4"].sample
    elsif two_unit_first_coord == "B1"
      @two_unit_second_coord = ["A1", "C1", "B2"].sample
    elsif two_unit_first_coord == "B2"
      @two_unit_second_coord = ["A2", "C2", "B1", "B3"].sample
    elsif two_unit_first_coord == "B3"
      @two_unit_second_coord = ["A3", "C3", "B2", "B4"].sample
    elsif two_unit_first_coord == "B4"
      @two_unit_second_coord = ["A4", "C4", "B3"].sample
    elsif two_unit_first_coord == "C1"
      @two_unit_second_coord = ["C2", "B1", "D1"].sample
    elsif two_unit_first_coord == "C2"
      @two_unit_second_coord = ["C1", "C3", "B2", "D2"].sample
    elsif two_unit_first_coord == "C3"
      @two_unit_second_coord = ["C4", "C2", "B3", "D3"].sample
    elsif two_unit_first_coord == "C4"
      @two_unit_second_coord = ["C3", "B4", "D4"].sample
    elsif two_unit_first_coord == "D1"
      @two_unit_second_coord = ["D2", "C1"].sample
    elsif two_unit_first_coord == "D2"
      @two_unit_second_coord = ["D1", "D3", "C2"].sample
    elsif two_unit_first_coord == "D3"
      @two_unit_second_coord = ["C3", "D2", "D4"].sample
    elsif two_unit_first_coord == "D4"
      @two_unit_second_coord = ["D3", "C4"].sample
    end
  end

  def three_unit_ship_first_coord
    @three_unit_first_coord = computer_grid.coordinates[rand(4)][rand(4)]
  end

  def three_unit_ship_second_coord
    if three_unit_first_coord == "A1"
      @three_unit_second_coord = ["A3", "C1"].sample
    elsif three_unit_first_coord == "A2"
      @three_unit_second_coord = ["A4", "C2"].sample
    elsif three_unit_first_coord == "A3"
      @three_unit_second_coord = ["A1", "C3"].sample
    elsif three_unit_first_coord == "A4"
      @three_unit_second_coord = ["A2", "C4"].sample
    elsif three_unit_first_coord == "B1"
      @three_unit_second_coord = ["D1", "B3"].sample
    elsif three_unit_first_coord == "B2"
      @three_unit_second_coord = ["D2", "B4"].sample
    elsif three_unit_first_coord == "B3"
      @three_unit_second_coord = ["B1", "D3"].sample
    elsif three_unit_first_coord == "B4"
      @three_unit_second_coord = ["B2", "D4"].sample
    elsif three_unit_first_coord == "C1"
      @three_unit_second_coord = ["A1", "C3"].sample
    elsif three_unit_first_coord == "C2"
      @three_unit_second_coord = ["A2", "C4"].sample
    elsif three_unit_first_coord == "C3"
      @three_unit_second_coord = ["C1", "A3"].sample
    elsif three_unit_first_coord == "C4"
      @three_unit_second_coord = ["A4", "C2"].sample
    elsif three_unit_first_coord == "D1"
      @three_unit_second_coord = ["B1", "D3"].sample
    elsif three_unit_first_coord == "D2"
      @three_unit_second_coord = ["D4", "B2"].sample
    elsif three_unit_first_coord == "D3"
      @three_unit_second_coord = ["D1", "B3"].sample
    elsif three_unit_first_coord == "D4"
      @three_unit_second_coord = ["B4", "D2"].sample
    end
  end

  def three_unit_ship_mid_coord
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
    end
  end

  def assure_three_unit_ship_not_on_occupied_coordinate
    if three_unit_first_coord == two_unit_first_coord
      verification
    elsif three_unit_first_coord == two_unit_second_coord
      verification
    elsif three_unit_second_coord == two_unit_first_coord
      verification
    elsif three_unit_second_coord == two_unit_second_coord
      verification
    elsif three_unit_mid_coord == two_unit_first_coord
      verification
    elsif three_unit_mid_coord == two_unit_second_coord
      verification
    else
      @verification = true
    end
  end

end