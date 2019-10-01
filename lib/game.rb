class Game 
  
  attr_accessor :board, :player_1, :player_2, :token
    WIN_COMBINATIONS = [
        [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]    
    ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
  end 
  
  def current_player
    if board.turn_count.even?
      player_1 
    else 
      player_2 
    end 
  end 
  
  def won?
      WIN_COMBINATIONS.each do |winning_combos|
        winning_index_1 = winning_combos[0]
        winning_index_2 = winning_combos[1]
        winning_index_3 = winning_combos[2]
        @win_position_1 = board.cells[winning_index_1]
        @win_position_2 = board.cells[winning_index_2]
        @win_position_3 = board.cells[winning_index_3]
        if (@win_position_1 == "X" && @win_position_2 == "X" && @win_position_3 == "X") || (@win_position_1 == "O" && @win_position_2 == "O" && @win_position_3 == "O")
            return winning_combos 
      end
    end 
    false  
  end 
  
  def draw?
    true if board.full? && !won?
  end 
  
  def over?
    true if draw? || won?
  end 
  
  def winner 
    if won?
      @win_position_1 
    end 
  end 
  
  def turn

    puts "#{current_player.token}, please make a move."
    input = current_player.move(board) 
    # binding.pry 
      if board.valid_move?(input) 
        board.update(input, current_player)
      else
        puts "That move was invalid, please make a valid move."
        input = current_player.move(board)
      end


  end 
  
  def play 
    until over?
      turn 
    end 
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end 
  end 
  
  

 
end 