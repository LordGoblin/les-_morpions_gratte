require 'player'
require 'board'

class Game
	attr_accessor :in_game, :score, :array_game, :player, :valeur_fin
	def initialize
		@player = Player.new.choix_player
		@board = Board.new
		@score = [0,0]
		@array_game = [" "," "," "," "," "," "," "," "," "]
		@valeur_fin = 0
	end

	def array_start(a)
		if a == 1
			puts "#{@player[0].upcase} joue :"
			a = "x"
		else 
			puts "#{@player[1].upcase} joue :"
			a = "o"
		end
		while true
			puts "choix case??"
			choix_player = gets.chomp.to_s.downcase
			if choix_player.size == 2 || choix_player[0..-2].ord == 99 || choix_player[0..-2].ord == 97 || choix_player[0..-2].ord == 98 || choix_player[1..-1].to_i < 3 || choix_player[1..-1].to_i >= 1
				case ((choix_player[0..-2].ord - 96).to_i)
				when 1
				 	if @array_game[(choix_player[1..-1].to_i)-1] != " "
				 		ptit_fraze_hala_kon(1)
				 	else
				 		@array_game[(choix_player[1..-1].to_i)-1] = a
				 		break
				 	end
				when 2
					if @array_game[(2 + choix_player[1..-1].to_i)] != " "
						ptit_fraze_hala_kon(1)
					else
				 		@array_game[(2 + choix_player[1..-1].to_i)] = a
				 		break
				 	end
				when 3
					if @array_game[(5 + choix_player[1..-1].to_i)] != " "
						ptit_fraze_hala_kon(1)
					else
				 		@array_game[(5 + choix_player[1..-1].to_i)] = a
				 		break
				 	end
				end
			else
				ptit_fraze_hala_kon(2)
			end
		end
	end

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

	def clean
		system("clear")
	end

	def player_win(b)
		if b == 1
			b = "x"
			a = @array_game.flatten.join
			a = a.gsub(/[o]/, ' ')
		else
			b = "o"
			a = @array_game.flatten.join
			a = a.gsub(/[x]/, ' ')
		end
		if a == "  x  x  x" || a == "  o  o  o" || a == " x  x  x " || a == " o  o  o " || a == "x  x  x  " || a == "o  o  o  "
			clean
			fonction_qui_a_pas_de_nom(b)
			return false
		elsif a == "xxx      " || a == "ooo      " || a == "   xxx   " || a == "   000   " || a == "      xxx" || a == "      ooo"
			clean
			fonction_qui_a_pas_de_nom(b)
			return false
		elsif a == "x   x   x" || a == "o   o   o" || a == "  x x x  " || a == "  o o o  "
			clean
			fonction_qui_a_pas_de_nom(b)
			return false
		else
			return true
		end
	end

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

	def score_table
		@board.score_player(@player,@score)
		@board.table(@array_game)	
	end

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

	def perform
		while true
			@valeur_fin = 0
			@array_game = [" "," "," "," "," "," "," "," "," "]
			puts "1.commencer"
			puts "3.retour menu"
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
	end
end