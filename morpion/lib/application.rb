require 'game'
require 'colorize'

class Application

	def perform
		puts "bienvenue dans morpion".colorize(:blue) 
		#menu du jeux
		while true
			puts "tu veu faire quoi?".colorize(:blue) 
			puts "1.joueur 1vs1".colorize(:blue) 
			puts "3.quit l'app".colorize(:blue) 
			choix_player = gets.chomp.to_i
			case choix_player
			when 1
				Game.new.perform
			when 3
				puts "a++".colorize(:red) 
				break
			else
				puts "ce choix n'existe pas...".colorize(:red) 
			end
		end
	end
end