require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(player, computer)
  if (player == 'rock' && (computer == 'lizard' || computer == 'scissors')) ||
     (player == 'paper' && (computer == 'spock' || computer == 'rock')) ||
     (player == 'scissors' && (computer == 'lizard' || computer == 'paper')) ||
     (player == 'lizard' && (computer == 'spock' || computer == 'paper')) ||
     (player == 'spock' && (computer == 'rock' || computer == 'scissors'))
    return 'player win'
  elsif (computer == 'rock' && (player == 'lizard' || player == 'scissors')) ||
        (computer == 'paper' && (player == 'spock' || player == 'rock')) ||
        (computer == 'scissors' && (player == 'lizard' || player == 'paper')) ||
        (computer == 'lizard' && (player == 'spock' || player == 'paper')) ||
        (computer == 'spock' && (player == 'rock' || player == 'scissors'))
    return 'computer win'
  else
  end
end

def short_hand!(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  else
    false
  end
end

player_wins = 0
computer_wins = 0

loop do
  choice = ''
  loop do
    prompt "Choose one: (r)ock (p)aper (s)cissors (l)izard (sp)ock"
    choice = gets.chomp
    if choice.length <= 2
      choice = short_hand!(choice)
    end
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt 'That\'s not a valid choice'
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt "You chose: #{choice} , Computer chose: #{computer_choice}"

  case win?(short_hand!(choice), computer_choice)
  when 'player win'
    prompt 'You won this round'
    player_wins += 1
  when 'computer win'
    prompt 'Computer won this round'
    computer_wins += 1
  else
    prompt 'It\'s a tie.'
  end

  if player_wins == 5
    prompt 'You won it all Good Job!'
  elsif computer_wins == 5
    prompt'Computer won! This time'
  else
    next
  end

  prompt 'Do you want to play again?'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks For playing!'
