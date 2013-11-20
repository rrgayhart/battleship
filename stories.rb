module Stories

  def welcome_story1
    puts "Welcome to Battleship! There are two players 
    and you sink some ships. What could be better than that?"
    puts "Each player has 5 boats of different sizes and you try
    to sink the other player's boats."
    puts "Let's start with Player 1. Player 2... look away."
    puts "Press any key to continue when you're ready..."
    next_move
  end

  def welcome_story2
    puts "Great. Let's place your five ships"
  end

  def board_set_up1
    puts "Here is your board."
    @game.display_board
  end

end
