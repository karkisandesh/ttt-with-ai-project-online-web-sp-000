class Board
  attr_accessor :cells
  
  def reset!
    @cells = Array.new(9, " ")
  end
 
 def initialize
   reset! 
 end
 
 def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "-----------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
 end
 
 def position(input)
   
 end
  
end