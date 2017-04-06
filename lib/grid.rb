require 'pry'
require 'pry-state'

class Grid
  attr_reader :coordinate_values_duplicate_check
  attr_accessor :coordinates, :all_coordinate_values, :row_a, :row_b, :row_c, :row_d

  def initialize
    @coordinates = [["A1", "A2", "A3", "A4"], 
                    ["B1", "B2", "B3", "B4"], 
                    ["C1", "C2", "C3", "C4"], 
                    ["D1", "D2", "D3", "D4"]]
    @all_coordinate_values = ["A1", "A2", "A3", "A4",
                              "B1", "B2", "B3", "B4", 
                              "C1", "C2", "C3", "C4", 
                              "D1", "D2", "D3", "D4"]
    @coordinate_values_duplicate_check = ["A1", "A2", "A3", "A4",
                              "B1", "B2", "B3", "B4", 
                              "C1", "C2", "C3", "C4", 
                              "D1", "D2", "D3", "D4"]
  end

  def display_grid
    @row_a = "A     " + all_coordinate_values[0].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[1].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[2].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[3].gsub(/[ABCD1234]/, " ")
    @row_b = "B     " + all_coordinate_values[4].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[5].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[6].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[7].gsub(/[ABCD1234]/, " ")
    @row_c = "C     " + all_coordinate_values[8].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[9].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[10].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[11].gsub(/[ABCD1234]/, " ")
    @row_d = "D     " + all_coordinate_values[12].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[13].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[14].gsub(/[ABCD1234]/, " ") + "     " + all_coordinate_values[15].gsub(/[ABCD1234]/, " ")
    puts "============================="
    puts ".     1     2     3     4"
    puts ""
    puts row_a
    puts ""
    puts row_b
    puts ""
    puts row_c
    puts ""
    puts row_d
    puts "============================="
  end

end

# grid = Grid.new
# grid.display_grid