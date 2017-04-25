module Communication

  def display_game_welcome_message
    p "Welcome to BATTLESHIP"
  end
  
  def display_menu_options
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def display_menu_options_from_instructions
    p "Would you like to (p)lay or (q)uit?"
  end

  def display_incorrect_menu_selection
    p "Sorry, did not understand."
  end

  def display_gameplay_instructions
    puts "Battleship is a game for two player where you try to guess the location of two ships your opponent has hidden on a grid. Your opponent will be me, the computer. Players take turns calling out a row and column, such as 'A1', attempting to name a square containing enemy ships. Each player gets a board with with a 4x4 grid and two ships (a two-unit ship and a three-unit ship), and a bunch of hit and miss markers. Sink all of your opponent's ships by correctly guessing their location."
    puts "Setup: I will place my ships randomly and you will be prompted to place your ships. Select the starting coordinate and ending coordinate of your ship. For example: a two-unit ship can be placed on 'A1 A2' or 'A2 B2' and a three-unit ship can be placed on 'A1 A3' or 'B2 B4'. You must place your ships horizontally or vertically. They can't wrap around the grid or hand over the grid. Ships can touch but can't be on the same space."
    puts "Interface: The grid will start of blank and every coordinate you choose to attack will either display an 'H' for Hit or 'M' for Miss."
  end

  def display_player_quit_the_game_message
    puts "You have quit the game."
  end

  def prompt_next_turn_action
    p "Hit 'ENTER' to continue"
  end
  
  def coordinates_not_acceptable_message
    puts "Sorry the position or size of your ship does not meet the requirements."
  end

  def prompt_user_two_ship_placement
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
  end

  def prompt_to_get_two_unit_ship_placement
    puts "Specify your two-unit placement like: 'A1 A2' or 'B3 C3'"
    puts "Enter the squares for the two-unit ship:"
  end

  def prompt_incorrect_coordinates
    puts "Sorry the coordinates do not match the coordinates on the grid."
  end

  def prompt_to_get_three_unit_ship_placement
    puts "Specify your three-unit placement like: 'A1 A3' or 'B2 D2'"
    puts "Enter the squares for the three-unit ship:"
  end

  def prompt_incorrect_ship_placement_or_position
    puts "Sorry the position or size of your ship does not meet the requirements."
  end

  def prompt_overlapping_coordinates_error_message
    puts "Sorry the coordinates overlap your two-unit ship"
  end

  def prompt_player_move
    p "Fire your shot by entering a coordinate you have not fired upon, i.e. 'A1'"
  end

  def prompt_already_fired_upon_target_message
    puts "Sorry you have already fired upon this target."
  end

  def prompt_hit_enemy_ship_message
    p "Hit enemy ship!"
  end

  def prompt_computer_message_to_player_sunk_two_unit_ship
    p "Sunk my two-unit ship!"
  end

  def prompt_computer_message_to_player_sunk_three_unit_ship
    p "Sunk my three-unit ship!"
  end

  def prompt_hit_player_ship_message
    p "Hit your ship!"
  end

  def prompt_computer_sunk_players_two_unit_ship
    p "Sunk your two-unit ship!"
  end

  def prompt_computer_sunk_players_three_unit_ship
    p "Sunk your three-unit ship!"
  end

  def prompt_missed_target
    p "Miss!"
  end

  def prompt_player_wins_message
    p "You sunk my final ship!"
    p "Congratulations!!!"
  end

  def prompt_player_loses_message
    p "I sunk your final ship!"
    p "GAME OVER"
  end

  def display_player_board_title
    p "PLAYER BOARD"
  end

  def display_computer_board_title
    p "COMPUTER BOARD"
  end
end