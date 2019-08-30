class Game 
  
  
  attr_accessor :board, :player_1, :player_2 , :last_who_played, :winner
  
  def initialize(player_1= Players::Human.new("X"),player_2= Players::Human.new("O"),board= Board.new )
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        
        [0,4,8],
        [2,4,6],
        
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]
    
    def current_player
      
        @board.turn_count % 2 == 0 ? @player_2 : @player_1
      
    end 
    
    def won? 
     result = nil
      WIN_COMBINATIONS.each do |combination| 
       if combination.all?{|el| @board.cells[el] == "X"} || combination.all?{|el| @board.cells[el] == "O"}
         @winner = combination.first
         result =  combination
       end
      end
      result == nil ? false : result
   
    end
   
   def draw? 
     !won? && @board.full? ? true : false
   end
   
   def over?
     draw? || won? ? true : false
   end
   
 
   
   def turn
    
      current_player == player_2 ? past_player = player_1 : past_player = player_2
      if @last_who_played != past_player
        @last_who_played = @board.update(past_player.move(@board),past_player) 
        
      else 
        @last_who_played = @board.update(current_player.move(@board),current_player) 
        
      end 
   
   end 
   
   def winner 
     won? ? champ = @board.cells[won?[0]] : nil 
     champ
   end
   
   def play 
     while over? == false do 
      turn 
     end  
     puts "Cat\'s Game!" if draw?
     puts "Congratulations #{winner}!" if won?
   end
    
  def start 
    play
  end
  
end