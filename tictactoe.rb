class GameBoard
    attr_accessor  :rows
    def initialize()
        @rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end
end

class Player
    def initialize(name, marker)
        @name = name
        @marker = marker
    end
end

class Game 
    def initialize()
        @board = GameBoard.new()
        puts "Player 1, what is your name?"
        player1_name = gets.chomp
        p "#{player1_name}, what letter or special character do you want to use for your marker?"
        player1_marker = gets.chomp
        p "Player 2, what is your name?"
        player2_name = gets.chomp
        p "#{player2_name}, what letter or special character do you want to use for your marker?"
        player2_marker = gets.chomp
        @player1 = Player.new(player1_name, player1_marker)
        @player2 = Player.new(player2_name, player2_marker)
        print_current_board()
    end

    def print_current_board()
        puts "        #  #{@board.rows[0][0]} | #{@board.rows[0][1]} | #{@board.rows[0][2]}
        # ---+---+---
        #  #{@board.rows[1][0]} | #{@board.rows[1][1]} | #{@board.rows[1][2]}
        # ---+---+---
        #  #{@board.rows[2][0]} | #{@board.rows[2][1]} | #{@board.rows[2][2]}"

    end

    
    
end


game = Game.new()
