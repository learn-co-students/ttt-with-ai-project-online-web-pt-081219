class TicTacToeController
  
  def welcome 
    puts "Welcome to Tic Tac Toe!"
    puts "Please enter 0, 1, or 2 for the number of players that wish to play."
    puts "To exit the game, please type 'exit'."
    
    input = gets.chomp.downcase 
    until input == "exit"
    
    case input 
    when "0"
      puts "Let the computer match begin!"
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("0"), Board.new) 
      new_game.play 
      puts "If you would like to play again, please enter 0, 1, or 2 for the number of players that wish to play."
    when "1"
      puts "Let's begin! You're first!"
      new_game = Game.new(Players::Human.new("X"), Players::Computer.new("0"), Board.new) 
      new_game.play 
      puts "If you would like to play again, please enter 0, 1, or 2 for the number of players
      that wish to play."
    when "2"
      puts "Choose your token! X goes first!"
      new_game = Game.new(Human::Computer.new("X"), Human::Computer.new("0"), Board.new)
      new_game.play 
      puts "If you would like to play again, please enter 0, 1, or 2 for the number of players
      that wish to play."
    else 
      "That is an invalid option, please enter 0, 1 or 2."
      input = gets.chomp 
    end 
  end 
  

    

     
    puts "Would you like to play again? Please type 'yes' or 'no'"
    play_again_input = gets.chomp.downcase 
    
    if play_again_input == "yes"
      puts "Please enter 0, 1, or 2 for the number of players that wish to play."
      input = gets.chomp 
      puts "Who will be the 'X' token?" #how to differentiate between each player or the player and the computer 
      token_input = gets.chomp.downcase 
    else 
      puts "Thanks for playing!"
    end 
    
  end 
  
  
end 


  # def call
  #   response = ""
  #   until response == "exit"
    
  #   puts "Welcome to your music library!"
  #   puts "To list all of your songs, enter 'list songs'."
  #   puts "To list all of the artists in your library, enter 'list artists'."
  #   puts "To list all of the genres in your library, enter 'list genres'."
  #   puts "To list all of the songs by a particular artist, enter 'list artist'."
  #   puts "To list all of the songs of a particular genre, enter 'list genre'."
  #   puts "To play a song, enter 'play song'."
  #   puts "To quit, type 'exit'."
  #   puts "What would you like to do?"
    
  #   response = gets.chomp 
  
  #   case response 
  #     when 'list songs'
  #       list_songs
  #     when 'list artists'
  #       list_artists
  #     when 'list genres'
  #       list_genres
  #     when 'list artist'
  #       list_songs_by_artist
  #     when 'list genre'
  #       list_songs_by_genre
  #     when 'play song'
  #       play_song
  #     else 
  #       "What would you like to do?"
  #     end 
  #   end 

  # end 

  # def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  #   @player_1 = player_1
  #   @player_2 = player_2
  #   @board = board 
  # end 