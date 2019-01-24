require 'game'

class Application

	def perform
		puts "bienvenue dans morpion"
		#menu du jeux
		while true
			puts "tu veu faire quoi?"
			puts "1.joueur 1vs1"
			puts "3.quit l'app"
			choix_player = gets.chomp.to_i
			case choix_player
			when 1
				Game.new.perform
			when 3
				puts "a++"
				break
			else
				puts "ce choix n'existe pas..."
			end
		end
	end
end