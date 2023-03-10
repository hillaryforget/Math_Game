require "./player"
require "./question"

class Game
  MAX_ROUNDS = 3

  def initialize(name)
    @name = name
    @p1 = Player.new("p1")
    @p2 = Player.new("p2")
    @new_question = Question.new
    @round_num = 0
  end

  def new
    puts "New Game"
    play
  end

  def round
    @round_num += 1
    puts "----- Round #{@round_num} -----"
    turn(@p1)
    score
    return if @p1.lives <= 0 # check if player 1 has run out of lives
    turn(@p2)
    score
    return if @p2.lives <= 0 # check if player 2 has run out of lives
  end

  def score
    puts "p1: #{@p1.lives}/3 lives"
    puts "p2: #{@p2.lives}/3 lives"
  end

  def turn(player)
    @new_question.ask_question(player.name)
    input = gets.chomp 
    if @new_question.correct(input)
      puts "Correct"
    else
      puts "Incorrect"
      player.lose_life
    end
  end

  def game_over
    puts "Game over!"
    if @p1.lives > @p2.lives
      puts "Player 1 wins!"
    elsif @p1.lives < @p2.lives
      puts "Player 2 wins!"
    else
      puts "It's a tie!"
    end
    prompt
  end

  def prompt
    puts "Would you like to play again? (Y/N)"
    input = gets.chomp.downcase
    if input == "y"
      reset
      new
    elsif input == "n"
      exit
    else
      puts "Invalid input."
      prompt
    end
  end

  def reset
    @p1.reset
    @p2.reset
    @round_num = 0
  end

  def play
    puts "Starting game..."
    while @round_num < MAX_ROUNDS
      round
      break if @p1.lives <= 0 || @p2.lives <= 0 # end the game if either player has run out of lives
    end
    game_over
  end
end
