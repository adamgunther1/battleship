require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_placement'

class ComputerPlacementTest < Minitest::Test

  def test_it_exists
    place = ComputerPlacement.new

    assert_instance_of ComputerPlacement, place
  end

  def test_first_coordinate_assignment
    place = ComputerPlacement.new
    first_coord = place.two_unit_ship_first_coord
    possible_coords = [["A1", "A2", "A3", "A4"], 
                    ["B1", "B2", "B3", "B4"], 
                    ["C1", "C2", "C3", "C4"], 
                    ["D1", "D2", "D3", "D4"]]
    includes_coord = possible_coords.any? do |index|
      first_coord
    end

    assert includes_coord  
  end

  def test_no_overlapping_coordinates
    9999.times do
      place = ComputerPlacement.new
      place.run
      refute_equal place.two_unit_first_coord, place.two_unit_second_coord
      refute_equal place.two_unit_first_coord, place.three_unit_first_coord
      refute_equal place.two_unit_first_coord, place.three_unit_second_coord
      refute_equal place.two_unit_first_coord, place.three_unit_mid_coord

      refute_equal place.two_unit_second_coord, place.three_unit_first_coord
      refute_equal place.two_unit_second_coord, place.three_unit_second_coord
      refute_equal place.two_unit_second_coord, place.three_unit_mid_coord

    end

  end
  
end