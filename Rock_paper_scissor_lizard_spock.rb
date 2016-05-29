require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts ("=> #{message}")
end

def win?(player, computer)
	if
    (player == 'rock' && computer == 'lizard' || computer =='scissors') ||
    (player == 'paper' && computer == 'spock' || computer == 'rock') ||
    (player == 'scissors' && computer == 'lizard' || computer == 'paper') ||
    (player == 'lizard' && computer == 'spock' || computer == 'paper') ||
	  (player == 'spock' && computer == 'rock' || computer == 'scissor')
	return 'player win'
	elsif
		(computer == 'rock' && player == 'lizard' || player =='scissors') ||
    (computer == 'paper' && player == 'spock' || player == 'rock') ||
    (computer == 'scissors' && player == 'lizard' || player == 'paper') ||
    (computer == 'lizard' && player == 'spock' || player == 'paper') ||
	  (computer == 'spock' && player == 'rock' || player == 'scissor')
	return 'computer win'
	else
	return 'tie'
	end
end

def short_hand!(choice)
 case choice.downcase
  when ('r' || 'rock')
	 'rock'
	when ('p' || 'paper')
	 'paper'
	when ('s' || 'scissors')
	 'scissors'
	when ('l' || 'lizard')
	 'lizard'
	else ('sp' || 'spock')
	 'spock'
  end
end

def who_won(winner)
player_wins = 0
computer_wins = 0
  if winner == 'player win'
    player_wins << 1
  else winner == "computer win"
    computer_wins << 1
  end
end
loop do
  loop do 
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice) || short_hand!(choice)
	    break
	  else
	    prompt("That's not a valid choice")
	  end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{short_hand!(choice)} , Computer chose: #{computer_choice}")

  player_wins = '1'
  computer_wins = '1'

  if eval player_wins == 5
    prompt "You won the game"
    break
  elsif eval computer_wins == 5
    prompt "The computer won the game"
    break
  else
  end
  
  case win?(short_hand!(choice), computer_choice)
  when 'player win'
    prompt "You won this round"
    player_wins << '+ 1'
    next
  when 'computer win'
    prompt "Computer won this round"
    computer_wins << '+ 1'
    next
  else 'tie'
    prompt("It's a tie.")
    next
  end
  end
	
prompt("Do you want to play again?")
answer = gets.chomp
break unless answer.downcase.start_with?('y') 
end

prompt("Thanks For playing!")
