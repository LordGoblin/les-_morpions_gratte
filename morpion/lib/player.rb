class Player
	attr_accessor :player1, :player2

	def choix_player
		puts "choix player :"
		puts "pseudo joueur1 :"
		@player1 = gets.chomp + "(X)"
		puts "bienvenu, #{@player1}\n\n"
		puts "pseudo joueur2 :"
		@player2 = gets.chomp + "(O)"
		puts "bienvenu, #{@player2}\n\n"
		return player = [@player1,@player2]
	end
end