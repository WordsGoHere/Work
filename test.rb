
def win?(player, computer)
player_win = 0
computer_win = 0
  if (player == 'rock' || player == 'spock' && computer =='scissors') ||
     (player == 'scissors' || player == 'spock' && computer == 'paper') ||
     (player == 'paper' || player == 'spock' && computer == 'rock') ||
	   (player == 'rock' || player == 'scissors' && computer == 'lizard') ||
	   (player == 'paper' || player == 'lizard' && computer == 'spock')
		 prompt("You won!")
		 player_win = player_win + 1
	elsif
		(computer == 'rock' || computer == 'spock' && player =='scissors') ||
    (computer == 'scissors' || computer == 'spock' && player == 'paper') ||
    (computer == 'paper' || computer == 'spock' && player == 'rock') ||
	  (computer == 'rock' || computer == 'scissors' && player == 'lizard') ||
	  (computer == 'paper' || computer == 'lizard' && player == 'spock')
		prompt("Computer won!")
		computer_win = computer_win + 1
	else
	  prompt("It's a tie.")
   end
end

choice = 'rock'
computer_choice = 'scissors'

def prompt(message)
  puts ("=> #{message}")
end

player_win = 0
computer_win = 0
loop do
win?(choice, computer_choice)

puts player_win
end