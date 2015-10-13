class Player
  attr_accessor :player_name
  def initialize
    @player_name
    @computer_name 
  end #initialize

  def assign_name(input)
    @player_name = input
  end #assign_name
    
       
end #Player
      

class Deck
  attr_accessor :deck
  
  def initialize
    @deck = []
    @deck_suits = ["clubs", "diamonds", "hearts", "spades"]
    @deck_numbers = ["Jack", "Queen", "King", "Ace"]
    @player_score = 0
    @computer_score = 0
    @cards_played = 0

    (2..10).each do |num| 
      @deck_numbers << num
    end #each

    @deck_suits.each do |suit|
      @deck_numbers.each do |num|
        if num == "Ace"
          @deck << {name: "#{num} of #{suit.capitalize}", value: 15 }
        elsif num == "Jack" || num == "Queen" || num == "King" # OR elsif num.to_i == 0
          @deck << {name: "#{num} of #{suit.capitalize}", value: 10 }
        else 
          @deck << {name: "#{num} of #{suit.capitalize}", value: num}
        end#if
      end#each numbers
    end#each suits
    @deck.shuffle!

  end#initialize

  def current_scores
    if @player_score > @computer_score
      puts "You are winning the war with #{@player_score}:#{@computer_score}."
    elsif @computer_score > @player_score
      puts "I am winning the war with #{@computer_score}:#{@player_score}."
    else
      puts "The war is currently tied at #{@computer_score} battles each."
    end #if
    card_counter
    #puts "PLAYED: #{@cards_played} | LEFT: #{52 - @cards_played}"
  end #current_scores

  def card_counter
    @cards_played = @player_score.to_i + @computer_score.to_i
    @cards_played 
  end #card_counter
    

  def draw
    @player_card = @deck.pop
    puts "You: #{@player_card[:name]}"
    @computer_card = @deck.pop
    puts "Computer: #{@computer_card[:name]}"
    if @player_card[:value] > @computer_card[:value]
      @player_score += 2      
    elsif @player_card[:value] < @computer_card[:value]
      @computer_score += 2
    else
      @player_score += 1
      @computer_score += 1
      puts "Tie!"
    end #if
    current_scores
  end #draw

 def announce_winner
    if @player_score > @computer_score
      puts
      puts "----------------"
      puts "The War is Over!"
      puts "You won #{@player_score}:#{@computer_score}!"
      puts "----------------"
    elsif @computer_score > @player_score
      puts
      puts "----------------"
      puts "The War is Over!"
      puts "I won #{@computer_score}:#{@player_score}."
      puts "----------------"
    else
      puts "-----------"
      puts "Game Over!"
      puts "The battle has come to a draw at #{@computer_score}:#{@player_score}."
    end #if
  end #announce_winner
 end #Deck
  
def play_game
  deck = Deck.new
  player = Player.new

  puts "-----------//------------"
  puts "|   Welcome to War      |"
  puts "-----------//------------"
  puts
  puts "Please enter your name:"
  player.assign_name(gets.chomp)
  puts "Hit enter to start the first battle"
  gets.chomp
  deck.draw
    while deck.card_counter < 52
      #puts "#{deck.card_counter}"
      gets.chomp
      deck.draw
    end #while
  puts deck.announce_winner
  play_again_query
   
end #play_game

def play_again_query
  puts "Play again? Y | N"
  @input = gets.chomp.upcase 
  if @input == "Y"
    play_game
  elsif @input == "N"
    puts "Okay Bye."
  else
    while @input != "N" && @input != "Y"
      puts "I'm sorry, that's not an option."
      play_again_query
    end #while
  end #if
end #play_again_query

play_game
  

