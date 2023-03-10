#TwO-O-Player Math Game
##Description
Simple OOP game in Ruby where 2 players start with 3 lives. If they mis-answer a question they lose a life. At the end of every turn, the game should output the new scores for both players. The game doesn’t end until one of the players loses all their lives. At this point, the game should announce who won and what the other player’s score is.

##Planning

###Class: Player

*Role: keep track of all the players names, games won/lost, how many lives they have left
*attributes: :name, :score, :lives
*methods: increase_score(), decrease_life()

###Class: Game

role: Keep track of which players turn it is, who the - - attributes :player1, :player2, :current_player
methods: change_player, new_question, start_game, end_game

##Getting Started

*clone the repo
*run from the project folder ruby main.rb
