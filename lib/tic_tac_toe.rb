class TicTacToe
    #allows us to read and modify the value of board
    attr_accessor :board
    #WIN_COMBINATIONS that stores an array of arrays where the numbers correspond to the indices on the game board.
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    #nitialize the instance variable @board with an empty array, representing the initial state of the Tic-Tac-Toe board.
    def initialize
        empty_array = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
        @board = empty_array
    end
    #print the current state of the Tic-Tac-Toe board. It accesses the board array 
    # and displays the values at specific indices in the form of a board.
    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
        
    end
    #method takes a user input and converts it to an index by subtracting 1. 
    def input_to_index(input)
      selection = input.to_i - 1
    end
    #method updates the board array at the given index with the specified token
    def move(index, token = 'X')
     board[index] = token
    end
    #checks if a position on the board is already taken by a player. 
        def position_taken?(index)
        (board[index] != ' ')
    end
    #checks  if the move is valid
    def valid_move? (index)
        (board[index] == ' ')
    end
    #calculates the number of turns that have been played based on the number of empty spaces left on the board.
    def turn_count
        9 - board.count(' ')
    end
    #method determines the current player based on the turn count.
    #  If the turn count is even, it returns 'X'; otherwise, it returns 'O'.
    def current_player
        self.turn_count.even? ? 'X' : 'O'
    end
    # turn method is responsible for executing a single turn in the Tic-Tac-Toe game. 
    def turn
        # prompts the user to enter their move by reading input from the command line and assigning it to the input variable.
    puts "Enter any number"
        input = gets
    # This line checks if the user's input is a valid move.
    self.turn unless (1..9).include?(input.to_i)
    #This line calls the input_to_index method to convert the user's input to a valid index on the board.
    position = self.input_to_index(input)
    # checks if the move to the position is valid by calling the valid_move?
       if valid_move? (position)
        # If the move is valid, this line calls the move method to 
        # update the board with the current player's token at the specified position.
          move(position, self.current_player)
        #   show the updated state of the board
          self.display_board
        end
    end
    #method checks all the possible winning combinations and 
    # determines if any player has won the game. 
    # It returns the winning combination if there is a winner, else false
    def won?
        WIN_COMBINATIONS.each do |comb|
            if [['X'], ['O']].include? ([board[comb[0]],board[comb[1]], board[comb[2]]].uniq)
                return comb
            end
        end
        false
    end
    # checks if the board is completely filled with player tokens, 
    # indicating a draw. It returns true if the board is full.
    def full?
        !board.include? (' ')
    end
    # method checks if the game is a draw, which happens when the board is full but no player has won. 
    def draw?
        self.full? && !self.won?
    end
    # checks if the game is over, which happens when there is a winner or a draw. It returns true if the game is over, and false 
    def over?
        self.won? || self.draw?
    end
    # method determines the winner of the game. 
    # If there is a winner, it returns the token of the opposite player.
    #  If there is no winner, it returns nil
    def winner
        if self.won?
            self.current_player == 'X' ? 'O' : 'X'
        end
    end
    # method controls the game flow by repeatedly calling the turn method until the game is over. and prints
    def play
        until self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end
end
game = TicTacToe.new
game.play
puts game
