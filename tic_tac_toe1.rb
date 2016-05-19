INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES =   [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
									[[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
									[[1, 5, 9], [3, 5, 9]]

                  
def prompt(message)
	puts "#{message}"
end

def display_board(brd)
	puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
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

def initialize_board
	new_board = {}
	(1..9).each{|num| new_board[num] = INITIAL_MARKER }
	new_board
end

def empty_squares(board)
	board.keys.select{|num| board[num] == INITIAL_MARKER }
end

def joinor(array, comma = ',', word = ' or')
	array[-1] = "#{word} #{array.last}" if array.size > 1
	array.join(comma)
end

def player_places_piece(board)
	square = ''
	loop do
		prompt"Choose a square #{joinor(empty_squares(board)) }"
		square = gets.chomp.to_i
		if board.keys.select{|num| board[num] == ' '}.include?(square)
		  break
		else
		  prompt"Between 1-9."
		end
	end
	board[square] = PLAYER_MARKER
end

def board_full(board)
  empty_squares(board).empty?
end

def someone_won(board)
  WINNING_LINES.each do |*l|
    if board.values_at(*l).count(PLAYER_MARKER) == 3
      return 'Player'
    else board.values_at(*l).count(COMPUTER_MARKER) == 3
    binding pry
      return 'Computer'
    end
  end 
  nil
end

def detect_winner(board)
  !!detect_winner(board)
end

def computer_places_piece(board)
	square = empty_squares(board).sample
	board[square] = COMPUTER_MARKER
end

loop do
board = initialize_board

  loop do
    player_places_piece(board)
	break if someone_won(board) || board_full(board)
	
    computer_places_piece(board)
	break if someone_won(board) || board_full(board)
    display_board(board)
  end
  
  if someone_won(board) == 'Player' || someone_won(board) == 'Computer'
    prompt"Congratulations #{someone_won(board)}!"
  else
    prompt"It's a Tie!"
  end

  prompt"Play Again (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 

prompt"Thanks for Playing"
