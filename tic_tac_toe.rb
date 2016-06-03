require 'pry'
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES =   [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]].freeze

def prompt(message)
  puts " => #{message}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, player, computer)
  system 'cls'
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

def joinor(array, comma = ',', word = ' or')
  array[-1] = "#{word} #{array.last}" if array.size > 1
  array.join(comma)
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
  board[square] = PLAYER_MARKER
  else 
  board[square] = COMPUTER_MARKER
  end
end

def board_full(board)
  empty_squares(board).empty?
end

def someone_won(board, player)
  WINNING_LINES.each do |line|
    if (board.values_at(*line).count(PLAYER_MARKER) == 3) && (player == 'X')
      return 'Player'
    elsif (board.values_at(*line).count(COMPUTER_MARKER) == 3) && (player == 'O')
      return 'Player'
    elsif (board.values_at(*line).count(PLAYER_MARKER) == 3) && (player == 'O')
      return 'Computer'
    elsif (board.values_at(*line).count(COMPUTER_MARKER) == 3) && (player == 'X')
      return 'Computer'
    else
      return 'tie'
    end
  end
end

def computer_places_piece(board, player)
  square = 0
  if board[5] == ' '
    computer_marker(board, 5, player)
  elsif
    WINNING_LINES.each do |line|
      if board.values_at(*line).count(COMPUTER_MARKER) == 2 && board.values_at(*line).include?(' ')
        if board[line[0]] == ' '
          return computer_marker(board,line[0],player)
        elsif board[line[1]] == ' '
          return computer_marker(board,line[1],player)
        else
          return computer_marker(board,line[2],player)
        end
      elsif board.values_at(*line).count(PLAYER_MARKER) == 2  && board.values_at(*line).include?(' ')
        if board[line[0]] == ' '
          return computer_marker(board,line[0],player)
        elsif board[line[1]] == ' '
          return computer_marker(board,line[1],player)
        else
          return computer_marker(board,line[2],player)
        end
      end
    end
  else 
    square = empty_squares(board).sample
  end
end

def computer_marker(board,square,player)
  if player == 'X'
    board[square] = COMPUTER_MARKER
  else 
    board[square] = PLAYER_MARKER
  end
end

def place_peice(board, player, computer)
  if player == 'X'
    player_places_piece(board, player)
      if someone_won(board, player) == 'Player' || board_full(board)
        return
      end
    computer_places_piece(board, player)
    binding.pry
  else
    computer_places_piece(board, player)
    display_board(board, player, computer)
      if someone_won(board, player) == 'Computer' || board_full(board)
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
  computer = player == 'X' ? 'O' : 'X' 

  loop do
    display_board(board, player, computer)
    place_peice(board, player, computer)
    binding.pry
    if someone_won(board, player) == 'Player' 
      prompt"Congratulations #{someone_won(board, player)}!"
      player_wins += 1
      break
    elsif someone_won(board, player) == 'Computer'
      prompt"Congratulations #{someone_won(board, player)}!"
      computer_wins += 1
      break
    else (board_full(board)) && (someone_won(board,player) == 'tie')
    binding.pry
      prompt"It's a Tie!"
      break
    end
  end

  prompt"Play Again (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt"Thanks for Playing"
