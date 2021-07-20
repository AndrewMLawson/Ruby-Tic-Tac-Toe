#      1    2   3
# c      |    |
#     -------------
# b      |    |
#     -------------
# a      |    |   

class GameBoard
    attr_accessor  :row1
    attr_accessor  :row2
    attr_accessor  :row3
    def initialize()
        @row1 = Array.new(3)
        @row2 = Array.new(3)
        @row3 = Array.new(3)
    end

    def board_status()
        p @row1
        p @row2
        p @row3
    end
    
    def print_gameboard()
        p ""
    end
end

class Player
    def initialize(marker)
     @marker = marker
    end

    def access?()
        p game1.row2
    end

    def place_marker(x, y)
        #
    end
 end 

game1 = GameBoard.new()
player1 = Player.new('X')
player1.access?


