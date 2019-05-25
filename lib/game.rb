require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] &&
    !(@board.cells[winner[0]] == "" || @board.cells[winner[0]] == " ")
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    #returns X when X won
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end
    
    def turn
      player = current_player
      puts "Please enter a number between 1-9"
      input = player.move(board)

      if @board.valid_move?(input)
        @board.update(input, current_player)
    else
      puts "Invalid move. Please try again"
        turn
    end
  end
   
   def play
     until over? 
      turn
    end
    
    puts draw? ?  "Cat's Game!" : "Congratulations #{winner}!"
  end
  
  
  
end