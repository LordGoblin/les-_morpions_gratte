require 'colorize'

class Player
	attr_accessor :player1, :player2
	#fonction de sélection des joueur
	def choix_player
		puts "choix player :".colorize(:blue) 
		puts "pseudo joueur1 :".colorize(:blue) 
		@player1 = gets.chomp + "(X)"
		puts "bienvenu, #{@player1}\n\n".colorize(:blue) 
		puts "pseudo joueur2 :".colorize(:blue) 
		@player2 = gets.chomp + "(O)"
		puts "bienvenu, #{@player2}\n\n".colorize(:blue) 
		return player = [@player1,@player2]
	end
end