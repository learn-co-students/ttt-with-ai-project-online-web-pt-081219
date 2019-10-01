# class TicTacToeController
  
#   def welcome 
#     puts "Welcome to Tic Tac Toe!"
#     puts "Please enter 0, 1, or 2 for the number of players that wish to play."
#     puts "To exit the game, please type 'exit'."
    
#     input = gets.chomp.downcase 
#     until input == "exit"
    
#     case input 
#     when "0"
#       puts "Let the computer match begin!"
#       new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("0"), Board.new) 
#       new_game.play 
#       puts "If you would like to play again, please enter 0, 1, or 2 for the number of players that wish to play."
#       input = gets.chomp.downcase 
#     when "1"
#       puts "Let's begin! You're first!"
#       new_game = Game.new(Players::Human.new("X"), Players::Computer.new("0"), Board.new) 
#       new_game.play 
#       puts "If you would like to play again, please enter 0, 1, or 2 for the number of players
#       that wish to play."
#       input = gets.chomp.downcase 
#     when "2"
#       puts "Choose your token! X goes first!"
#       new_game = Game.new(Human::Computer.new("X"), Human::Computer.new("0"), Board.new)
#       new_game.play 
#       puts "If you would like to play again, please enter 0, 1, or 2 for the number of players
#       that wish to play."
#       input = gets.chomp.downcase 
#     else 
#       "That is an invalid option, please enter 0, 1 or 2."
#       input = gets.chomp 
#     end 
    
#   end 

# end 
