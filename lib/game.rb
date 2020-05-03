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

  def initialize(p1 = Players::Human.new("X"), p2 = Players:: Human.new("O"), board = Board.new)
    @player_1 = p1 
    @player_2 = p2
    @board = board
  end 

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end 

  def won? 
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end 
  end 

  def draw?
    @board.full? && !won?
  end 

  def over?
    draw? || won?
  end 

  def winner 
    won? ? @board.cells[won?.first] : nil
  end 

  def turn 
    puts "Please choose your move, 1-9"
    player = current_player
    index = player.move(@board)

    if @board.valid_move?(index)
      @board.update(index, player)
      @board.display
    else
      puts "Invalid move."
      turn
    end
  end 

  def play 
    until over? 
      turn
    end 
    if won? 
      champ = winner
      puts "Congratulations #{champ}!"
    else  draw?
     puts "Cat's Game!"
    end 
  end 

  def start 
    puts "What kind of game do you want to play?"
    puts "enter '0' for game of two computers"
    puts "enter '1' for game of human vs computer"
    puts "enter '2' for game of two humans"
    input = gets.strip 
    case input 
      when "0" 
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      when "1"
        puts "Would you like to go first? (y/n) if so, you will be X "
        response = gets.strip.downcase
         if response == "y" 
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
         else 
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
         end 
      when "2"
        game = Game.new()
      else 
        puts "invalid choice"
        start
      end 
    until game.over?
      game.play
    end 
  end 

end 