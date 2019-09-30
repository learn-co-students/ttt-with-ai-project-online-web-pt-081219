class Board 
  attr_accessor :cells
  
  def initialize 
    reset!
  end
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "] 
  end 
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(user_input) 
    user_input_to_index = user_input.to_i - 1 
    @cells[user_input_to_index]
  end
  
  def full? 
    @cells.include?(" ") ? false : true
  end
  
  def turn_count 
    
     @cells.count(" ") / 2 
  
  end
  
  def taken?(position) 
    @cells[position.to_i - 1 ] == " " ? false : true
  end 
  
  def valid_move?(position) 
    position.to_i.between?(1,9) && !taken?(position) ? true : false
  end 
  
  
  def update(position, player)
    
      if !valid_move?(position)  
         player.move(self)
       else
          @cells[position.to_i - 1] = player.token 
          player
      end
  end

end