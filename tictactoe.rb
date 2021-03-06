class GameBoard
    attr_accessor  :rows
    def initialize()
        @rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end
end

class Player
    attr_reader :name, :marker, :moves
    def initialize(name, marker)
        @name = name
        @marker = marker
        @moves = []
    end
end

class Game 
    def initialize()
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
        @board = GameBoard.new()
        @player1_turn = true
        @wins = [[1, 2, 3], [4, 5, 6], [7, 8 , 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
        play_turn()
    end

    def print_current_board()
        puts "        #  #{@board.rows[0][0]} | #{@board.rows[0][1]} | #{@board.rows[0][2]}
        # ---+---+---
        #  #{@board.rows[1][0]} | #{@board.rows[1][1]} | #{@board.rows[1][2]}
        # ---+---+---
        #  #{@board.rows[2][0]} | #{@board.rows[2][1]} | #{@board.rows[2][2]}"

    end

    def play_turn()
        print_current_board()
        if @player1_turn
            @player1_turn = false
            p "#{@player1.name}, choose your space!"
            move = gets.chomp.to_i
            @player1.moves.push(move)
            add_marker(move, @player1.marker)
            win_check(@player1)
        else
            @player1_turn = true
            p "#{@player2.name}, choose your space!"
            move = gets.chomp.to_i
            @player2.moves.push(move)
            add_marker(move, @player2.marker)
            win_check(@player2)
        end
    end

    def add_marker(move, marker)
        i = 0
        while i < 3 do
            if @board.rows[i].index(move)
                to_replace = @board.rows[i].index(move)
                @board.rows[i][to_replace] = marker
                break
            else
                i += 1
            end
        end
    end

    # Remember to play_turn()!!!
    def win_check(player)
        for i in 0..8 do
            if i == 8
                play_turn()
            elsif @wins[i].all? {|item| player.moves.include?(item)} == true
                display_win(player.name)
                break
            end
        end
    end
    def display_win(player_name)
        print_current_board()
        p "You win #{player_name}!"
        p "Would you like to play again? yes or no?"
        answer = gets.chomp
        if answer == "yes"
            Game.new()
        else
            p "Thank you for playing, goodbye!"
        end
    end
end


game = Game.new()
