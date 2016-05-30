require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(player, computer)
  if (player == 'rock' && computer == 'lizard' || computer == 'scissors') ||
     (player == 'paper' && computer == 'spock' || computer == 'rock') ||
     (player == 'scissors' && computer == 'lizard' || computer == 'paper') ||
     (player == 'lizard' && computer == 'spock' || computer == 'paper') ||
     (player == 'spock' && computer == 'rock' || computer == 'scissor')
    return 'player win'
  elsif (computer == 'rock' && player == 'lizard' || player == 'scissors') ||
        (computer == 'paper' && player == 'spock' || player == 'rock') ||
        (computer == 'scissors' && player == 'lizard' || player == 'paper') ||
        (computer == 'lizard' && player == 'spock' || player == 'paper') ||
        (computer == 'spock' && player == 'rock' || player == 'scissor')
    return 'computer win'
  else
  end
end

def short_hand!(choice)
  case choice
  when 'r' || 'rock'            #I'm unsure of this code it is assigning
    'rock'                      #'spock' to 'r' and 'rock'.  What's
  when 'p' || 'paper'           #happening here?  I've used parentheses around the   
    'paper'                     #boolean statements and rearranged the case function.
  when 's' || 'scissors'        
    'scissors'
  when 'l' || 'lizard'
    'lizard'
  else 'sp' || 'spock'
    'spock'
  end
end

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

  case win?(short_hand!(choice), computer_choice)
  when 'player win' && eval(player_wins) == 4
    prompt("You won! It all Good Job!")
    player_wins
  when 'computer win' && eval(computer_wins) == 4
    prompt("Computer won! This time")
    computer_wins
  when 'player win'
    prompt "You won this round"
    player_wins << '+ 1'
    next
  when 'computer win'
    prompt "Computer won this round"
    computer_wins << '+ 1'
    next
  else 
    prompt("It's a tie.")
    next
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks For playing!")
