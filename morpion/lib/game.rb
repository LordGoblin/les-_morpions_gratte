require 'player'
require 'board'
require 'colorize'

class Game
	attr_accessor :in_game, :score, :array_game, :player, :valeur_fin
	def initialize
		@player = Player.new.choix_player
		@board = Board.new
		@score = [0,0]
		@array_game = [" "," "," "," "," "," "," "," "," "]
		@valeur_fin = 0
	end
	#fonction saisie des joueur
	def array_start(a)
		if a == 1
			puts "#{@player[0].upcase} joue :".colorize(:blue) 
			a = "x"
		else 
			puts "#{@player[1].upcase} joue :".colorize(:blue) 
			a = "o"
		end
		while true
			choix_player = gets.chomp.to_s.downcase
			if choix_player.size == 2 || choix_player[0..-2].ord == 99 || choix_player[0..-2].ord == 97 || choix_player[0..-2].ord == 98 || choix_player[1..-1].to_i < 3 || choix_player[1..-1].to_i >= 1
				case ((choix_player[0..-2].ord - 96).to_i)
				when 1
				 	if @array_game[(choix_player[1..-1].to_i)-1] != " "
				 		@board.ptit_fraze_hala_kon(1)
				 	else
				 		@array_game[(choix_player[1..-1].to_i)-1] = a
				 		break
				 	end
				when 2
					if @array_game[(2 + choix_player[1..-1].to_i)] != " "
						@board.ptit_fraze_hala_kon(1)
					else
				 		@array_game[(2 + choix_player[1..-1].to_i)] = a
				 		break
				 	end
				when 3
					if @array_game[(5 + choix_player[1..-1].to_i)] != " "
						@board.ptit_fraze_hala_kon(1)
					else
				 		@array_game[(5 + choix_player[1..-1].to_i)] = a
				 		break
				 	end
				end
			else
				@board.ptit_fraze_hala_kon(2)
			end
		end
	end
	 #fonction qui compte les tours et termine la parti sur une égalité
	def test_fin
		@valeur_fin = @valeur_fin + 1
		if @valeur_fin >= 9
			clean
			@board.win_player("égale")
			score_table
			return false
		end
		return true
	end
	#fonction nettoyage
	def clean
		system("clear")
	end
	#fonction qui determine si un joueur a gagner la parti 
	def player_win(b)
		if b == 1
			b = "x"
		else
			b = "o"
		end
		if @array_game[2] == b && @array_game[5] == b && @array_game[8] == b || @array_game[1] == b && @array_game[4] == b && @array_game[7] == b || @array_game[0] == b && @array_game[3] == b && @array_game[6] == b
			clean
			fonction_qui_a_pas_de_nom(b)
			return false
		elsif @array_game[0] == b && @array_game[1] == b && @array_game[2] == b || @array_game[3] == b && @array_game[4] == b && @array_game[5] == b || @array_game[6] == b && @array_game[7] == b && @array_game[8] == b
			clean
			fonction_qui_a_pas_de_nom(b)
			return false
		elsif @array_game[0] == b && @array_game[4] == b && @array_game[8] == b || @array_game[2] == b && @array_game[4] == b && @array_game[6] == b
			clean
			fonction_qui_a_pas_de_nom(b)
			return false
		else
			return true
		end
	end
	#fonction qui porte bien son nom
	def fonction_qui_a_pas_de_nom(a)
		if a == "x"
			@board.win_player(@player[0])
			@score[0] = @score[0] + 1
		else
			@board.win_player(@player[1])
			@score[1] = @score[1] + 1
		end
		score_table
	end
	#affiche le score et le tableau
	def score_table
		@board.score_player(@player,@score)
		@board.table(@array_game)	
	end
	#fonction qui gere la parti
	def start
		while true
			clean
			score_table
			array_start(1)
			if player_win(1) == false || test_fin == false 
				break
			end
			clean
			score_table
			array_start(2)
			if player_win(2) == false || test_fin == false
				break
			end
		end
	end
	#fonction save
	def save
		a = []
		File.open("db/save.csv", "a") do |f|
			a = "|#{player[0]}: #{score[0]}     |_SCORE_|     #{player[1]}: #{score[1]}|"
 		 	f.write(a)
 		end
	end
	#fonction qui lance une parti 
	def perform
		while true
			@valeur_fin = 0
			@array_game = [" "," "," "," "," "," "," "," "," "]
			puts "1.commencer".colorize(:blue) 
			puts "3.retour menu".colorize(:blue) 
			case gets.chomp.to_i
			when 1
				clean
				start
			when 3
				clean 
				@board.score_player(@player,@score)
				print "\n\n"
				break
			end
		end
	save	
	end
end