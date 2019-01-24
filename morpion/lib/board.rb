require 'colorize'

class Board
	attr_accessor :board
	#fonction qui affiche la table
	def table(array_table)
		puts "   _____1___________2____________3_____ ".colorize(:green)
		puts "  |           |           |            |".colorize(:green)
		puts "  |    #{array_table[0]*3}    |    #{array_table[1]*3}    |    #{array_table[2]*3}     |".colorize(:green)
		puts "A |    #{array_table[0]*3}    |    #{array_table[1]*3}    |    #{array_table[2]*3}     |".colorize(:green)
		puts "  |    #{array_table[0]*3}    |    #{array_table[1]*3}    |    #{array_table[2]*3}     |".colorize(:green)
		puts "  |___________|___________|____________|".colorize(:green)
		puts "  |           |           |            |".colorize(:green)
		puts "B |    #{array_table[3]*3}    |    #{array_table[4]*3}    |    #{array_table[5]*3}     |".colorize(:green)
		puts "  |    #{array_table[3]*3}    |    #{array_table[4]*3}    |    #{array_table[5]*3}     |".colorize(:green)
		puts "  |    #{array_table[3]*3}    |    #{array_table[4]*3}    |    #{array_table[5]*3}     |".colorize(:green)
		puts "  |___________|___________|____________|".colorize(:green)
		puts "  |           |           |            |".colorize(:green) 
		puts "  |    #{array_table[6]*3}    |    #{array_table[7]*3}    |    #{array_table[8]*3}     |".colorize(:green) 
		puts "C |    #{array_table[6]*3}    |    #{array_table[7]*3}    |    #{array_table[8]*3}     |".colorize(:green)
		puts "  |    #{array_table[6]*3}    |    #{array_table[7]*3}    |    #{array_table[8]*3}     |".colorize(:green)
		puts "  |___________|___________|____________|".colorize(:green)
	end
	#fonction pour les score
	def score_player(player,score)
		puts "|#{player[0]}: #{score[0]}     |_SCORE_|     #{player[1]}: #{score[1]}|\n\n".colorize(:red) 
	end
	#fonction qui porte bien son nom
	def ptit_fraze_hala_kon(a)
		case a
		when 1
			puts "tricheur".colorize(:red) 
		when 2
			puts "tu t'es trompé".colorize(:red) 
		end
	end
	#fonction qui affiche le resultat d'une parti
	def win_player(a)
		if a == "égale"
			puts "***************************".colorize(:yellow) 
			puts "EGALITEE".colorize(:yellow) 
			puts "***************************".colorize(:yellow) 
		else
			puts "***************************".colorize(:yellow) 
			puts "#{a.upcase} WIN !!".colorize(:yellow) 
			puts "***************************".colorize(:yellow) 
		end
	end
end