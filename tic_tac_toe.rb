require 'pry'
INITIAL_MARKER = ' '.freeze
MARKER_X = 'X'.freeze
MARKER_O = 'O'.freeze
WINNING_LINES =   [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]].freeze

def prompt(message)
  puts " => #{message}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, player, computer)
  system 'cls'
  system 'clear'
  puts "You're a #{player}. Computer is a #{computer}"
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def joinor(picks_array, comma = ',', word = ' or')
  picks_array[-1] = "#{word} #{picks_array.last}" if picks_array.length > 1
  picks_array.join(comma)
end

def player_places_piece(board, player)
  square = ''
  loop do
    prompt"Choose a square #{joinor(empty_squares(board))}"
    square = gets.chomp.to_i
    if board.keys.select { |num| board[num] == ' ' }.include?(square)
      break
    else
      prompt"Between 1-9."
    end
  end
  if player == "X"
  board[square] = MARKER_X
  else 
  board[square] = MARKER_O
  end
end

def board_full(board)
  empty_squares(board).empty?
end

#Counts the number of MARKERS in the arrays of the WINNING_LINES constant
#and reports back if any of the arrays are full of MARKER_X or _O.
def someone(board, player)
  WINNING_LINES.each do |line|
    if (board.values_at(*line).count(MARKER_X) == 3) && (player == 'X')
      return 'Player'
    elsif (board.values_at(*line).count(MARKER_O) == 3) && (player == 'O')
      return 'Player'
    elsif (board.values_at(*line).count(MARKER_X) == 3) && (player == 'O')
      return 'Computer'
    elsif (board.values_at(*line).count(MARKER_O) == 3) && (player == 'X')
      return 'Computer'
    elsif board_full(board)
      return 'tie'
    else
    end
  end
end

#This method determines where a computer places a peice.  If there are
#two places occupied by the same MARKER in an array in the WINNING_LINES
#constant it will place a MARKER_X or _O in the open space in that array.
def computer_places_piece(board, player, computer)
  square = 0
  if board[5] == ' '
    board[5] = computer
  else
    WINNING_LINES.each do |line|
      if board.values_at(*line).count(computer) == 2 && board.values_at(*line).include?(' ')
        if board[line[0]] == ' '
          return board[line[0]] = computer
        elsif board[line[1]] == ' '
          return board[line[1]] = computer
        else
          return board[line[2]] = computer
        end
      elsif board.values_at(*line).count(player) == 2  && board.values_at(*line).include?(' ')
        if board[line[0]] == ' '
          return board[line[0]] = computer
        elsif board[line[1]] == ' '
          return board[line[1]] = computer
        else
          return board[line[2]] = computer
        end
      else
        square = empty_squares(board).sample
      end
    end
  end
end

#This method places pieces on the board the statements
#inside are to determine which piece is placed first.
def place_piece(board, player, computer)
  if player == 'X'
    player_places_piece(board, player)
      if someone(board, player) == 'Player' || board_full(board)
        return
      end
    computer_places_piece(board, player, computer)
    display_board(board, player, computer)
  else
    computer_places_piece(board, player, computer)
    display_board(board, player, computer)
      if someone(board, player) == 'Computer' || board_full(board)
        return
      end
    player_places_piece(board, player)
  end
end

def pick_player
  puts "Hello who would you like to play as? 'X' or 'O'"
  answer = ''
  loop do
    answer = gets.chomp
    if answer == 'X'
      'X'
      break
    elsif answer == 'O'
      'O'
      break
    else
      prompt "Try Again"
    end
  end
  answer
end

player_wins = 0
computer_wins = 0

loop do
  board = initialize_board
  player = pick_player
  computer = (player == 'X' ? 'O' : 'X') 

  loop do
    display_board(board, player, computer)
    place_piece(board, player, computer)
    if someone(board, player) == 'Player' 
      prompt"Congratulations #{someone(board, player)}!"
      player_wins += 1
      break
    elsif someone(board, player) == 'Computer'
      prompt"Congratulations #{someone(board, player)}!"
      computer_wins += 1
      break
    elsif board_full(board) && someone(board,player) == 'tie'
      prompt"It's a Tie!"
      break
    else
      next
    end
  end

  prompt"Play Again (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt"Thanks for Playing"
