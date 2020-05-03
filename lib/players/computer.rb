module Players 
  class Computer < Player 

    # need to work on better AI strategy

    def move(board)
      if !(board.cells[4] == " ")
        board.cells.each_with_index do |cell, index|
          if cell == " "
            position =  index + 1
            return position.to_s 
          end 
        end
      else 
        return "5"
      end 
    end 
    
  end 
end 