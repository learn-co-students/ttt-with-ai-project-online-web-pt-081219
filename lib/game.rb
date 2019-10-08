class Game 
  attr_accessor :board, :player_1, :player_2
  
   WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if @board.turn_count % 2 == 0 
      return player_1
    else 
      return player_2
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
     if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0])
       return combo 
     end 
    end
  end
  
    def draw?
    return true if @board.full? && !won?
    puts "Cat's Game!"
  end 
  
   def over?
    return true if draw? || won?
  end 
  
  def winner
   x_token = "X"
   o_token = "O"
   
   if won? && @board.cells.count("X") > @board.cells.count("O")
     return x_token
     puts "Congratulaions X!"
   elsif won? && @board.cells.count("X") <= @board.cells.count("O")
    return o_token
    puts "Congratulaions O!"
   else 
    return nil 
   end
 end
 
  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move)
       @board.update(current_move, player)
    else
      turn 
    end
  end
  
  def play
    while !over? && !draw?
      turn
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  
end 