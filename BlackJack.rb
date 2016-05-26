require 'pry'

DECK = { 'Hearts' => ['K10', 'Q10', 'J10', '10', '9', '8', '7',
        '6', '5', '3', '2', '1'], 'Spades' => ['K10', 'Q10', 'J10',
        '10', '9', '8', '7', '6', '5', '3', '2', '1'], 'Clubs' => 
        ['K10', 'Q10', 'J10', '10', '9', '8', '7', '6', '5', '3',
        '2', '1'], 'Diamond' => ['K10', 'Q10', 'J10', '10', '9', '8',
        '7', '6', '5', '3', '2', '1'] }.freeze

BLACKJACK = 21.freeze

public

def prompt(message)
  puts " => #{message}"
end

def deal(player, str)
  used_cards = []
  loop do
    suit = DECK.keys.sample
    arr = DECK.values.sample
    card = arr.sample
    card = ace_check(card, str)
    break if used_cards.flatten.include?(suit) &&
             used_cards.flatten.include?(card)
             player << [suit, card]
             used_cards << [suit, card]
  end
end

def player_ace(card,player)
  prompt"You have an Ace"                   
  prompt"Is that an 11 or a 1?"
  answer = gets.chomp
    if answer == '1'
      return card = 1
    else
      return card = 11
    end   
end

def ace_check(card, player)
  if card == '1' && player == 'player'
    return player_ace(card, player)      
  elsif card == '1'                      
    if greater_than(11, add_hand(player))
      return card = 11
    else
      return card = 1
    end
  else
  return card
  end
end

def remove(array)
  x = array.delete_if { |word| word == /["Hearts""Spades""Clubs""Diamond"]/ }
  x.to_s.split('').delete_if { |letter| letter == /[KQJ]/ }
end

def add_hand(array) 
  new_array = array.flatten.remove(array).inject { |sum, num| sum + num }
  return new_array
end
 
def winner_check(human, computer)
  case 
  when (bigger(human, computer) && !Busted?(human)) || Busted?(computer)
    return 8
  when (bigger(computer,human) && !Busted?(computer)) || Busted?(human)
    return 7
  else
    return 6
  end
end

def bigger(human, computer)
  if add_hand(human) > add_hand(computer)
    return true
  end
end

def Busted?(hand)
  if add_hand(hand) > BLACKJACK
    return true
  end
  false
end

loop do

  prompt"Welcome to Black Jack!"

  play_h = []
  comp_h = []

  deal(play_h, 'player')
  deal(play_h, 'player')

  prompt"You have #{play_h[0]} and #{play_h[1]}"

  loop do
    break if Busted?(play_h)
      prompt"Stay or Hit?"
      answer = gets.chomp
    case answer.downcase
    when 'hit'
      deal(play_h, 'player')
    when 'stay'
      break
    else
      prompt"Pick either Stay or Hit"
    end
  prompt"You have #{play_h}"
  end

  deal(comp_h, 'computer')
  deal(comp_h, 'computer')

  prompt"Dealer has #{comp_h[0]} and #{comp_h[1]}"

  loop do
    break if add_hand(comp_h) > 15 || Busted?
      deal(comp_h, 'computer')
    end
  
  player_wins = 0
  computer_wins = 0
  
  prompt"You had #{play_h}, the Computer had #{comp_h}"
  case winner_check(play_h, comp_h)
  when 8
    prompt "You Won!"
    player_wins + 1
  when 7
    prompt "The Computer Won"
    computer_wins + 1
  else 6
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
