require 'pry'
require 'pry-state'

class Grid
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
  end

  def display_grid
    @row_a = "A                        "
    @row_b = "B                        "
    @row_c = "C                        "
    @row_d = "D                        "
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