require 'pry'

SUITS = %w(Hearts Clubs Spades Diamonds)
CARDS = [*2..10]
FACECARDS = %w(Ace King Queen Jack)
BLACKJACK = 21.freeze

def initialize_deck
  (CARDS + FACECARDS).product(SUITS)
end

public

def prompt(message)
  puts " => #{message}"
end

def deal(player, str, deck)
  used_cards = []
  loop do
    card = deck.sample   
    if used_cards.include?(card)
      next
    else
      ace_check(card, str)
      player << card
      used_cards << card
      break
    end
  end
end

def player_ace(card)
  prompt"You have an Ace"                   
  prompt"Is that an 11 or a 1?"
  answer = gets.chomp
    if answer == '1'
      return card[0] = 1
    else
      return card[0] = 11
    end   
end

def ace_check(card, player)
  if card[0] == "Ace" && player == 'player'
    return player_ace(card)      
  elsif card[0] == "Ace"                     
    if add_hand(player) < 11
      return card[0] = 11
    else
      return card[0] = 1
    end
  else
  return card
  end
end

def add_hand(array)
  facecards_to_numbers = array.map { |pair| pair.include?(FACECARDS)? pair[0] == 10 : return }
  hand_total = 0
  facecards_to_numbers.each do |num| 
    hand_total += num[0]
  end
  hand_total
  binding.pry
end
 
def winner_check(human, computer)
  case 
  when (bigger(human, computer) && !busted?(human)) || busted?(computer)
    return "win"
  when (bigger(computer,human) && !busted?(computer)) || busted?(human)
    return "computer won"
  else
    return "tie"
  end
end

def bigger(human, computer)
  if add_hand(human) > add_hand(computer)
    return true
  end
end

def busted?(hand)
  if add_hand(hand) > BLACKJACK
    return true
  end
  false
end

loop do

  prompt"Welcome to Black Jack!"
  
  deck = initialize_deck
  
  play_h = []
  comp_h = []
  
  deal(play_h, 'player', deck)
  deal(play_h, 'player', deck)
  deal(comp_h, 'computer', deck)

  prompt"You have #{play_h[0]} : #{play_h[1]}"
  prompt"The computer has #{comp_h} showing."
  
  loop do
    if busted?(play_h)
      prompt"Stay or Hit?"
      answer = gets.chomp
      break
    end
    case answer.downcase
    when 'hit'
      deal(play_h, 'player', deck)
    when 'stay'
      break
    else
      prompt"Pick either Stay or Hit"
    end
  prompt"You have #{play_h}"
  end

  deal(comp_h, 'computer', deck)

  prompt"Dealer has #{comp_h[0]} and #{comp_h[1]}"

  loop do
    break if add_hand(comp_h) > 15 || busted?(comp_h)
    deal(comp_h, 'computer', deck)
  end
  
  player_wins = 0
  computer_wins = 0
  
  prompt"You had #{play_h}, the Computer had #{comp_h}"
  case winner_check(play_h, comp_h)
  when "win"
    prompt "You Won!"
    player_wins + 1
  when "computer won"
    prompt "The Computer Won"
    computer_wins + 1
  else "tie"
    prompt "You Both Busted"
  end
  
  break if player_wins == 5
    prompt "You WON"
  break if computer_wins == 5
    prompt "Computer won this time"
 
  prompt"Do you want to Play again? Yes or No"
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end
prompt"Thanks For Playing"
