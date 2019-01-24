require 'boardcase'

class Board
	attr_accessor :board
	#fonction qui affiche la table
	def table(array_table)
		puts "   _____1___________2____________3_____ "
		puts "  |           |           |            |"
		puts "  |    #{array_table[0]*3}    |    #{array_table[1]*3}    |    #{array_table[2]*3}     |"
		puts "A |    #{array_table[0]*3}    |    #{array_table[1]*3}    |    #{array_table[2]*3}     |"
		puts "  |    #{array_table[0]*3}    |    #{array_table[1]*3}    |    #{array_table[2]*3}     |"
		puts "  |___________|___________|____________|"
		puts "  |           |           |            |" 
		puts "B |    #{array_table[3]*3}    |    #{array_table[4]*3}    |    #{array_table[5]*3}     |" 
		puts "  |    #{array_table[3]*3}    |    #{array_table[4]*3}    |    #{array_table[5]*3}     |"
		puts "  |    #{array_table[3]*3}    |    #{array_table[4]*3}    |    #{array_table[5]*3}     |"
		puts "  |___________|___________|____________|"
		puts "  |           |           |            |" 
		puts "  |    #{array_table[6]*3}    |    #{array_table[7]*3}    |    #{array_table[8]*3}     |" 
		puts "C |    #{array_table[6]*3}    |    #{array_table[7]*3}    |    #{array_table[8]*3}     |"
		puts "  |    #{array_table[6]*3}    |    #{array_table[7]*3}    |    #{array_table[8]*3}     |"
		puts "  |___________|___________|____________|"
	end
	#fonction pour les score
	def score_player(player,score)
		puts "|#{player[0]}: #{score[0]}     |_SCORE_|     #{player[1]}: #{score[1]}|\n\n"
	end
	#fonction qui porte bien son nom
	def ptit_fraze_hala_kon(a)
		case a
		when 1
			puts "il y a deja une valeur"
		when 2
			puts "pas les bonne valeur"
		end
	end
	#fonction qui affiche le resultat d'une parti
	def win_player(a)
		if a == "égale"
			puts "***************************"
			puts "EGALITEE"
			puts "***************************"
		else
			puts "***************************"
			puts "#{a.upcase} WIN !!"
			puts "***************************"
		end
	end
end