Deck = { 'Hearts' => ['K10', 'Q10', 'J10', '10', '9', '8', '7',
        '6', '5', '3', '2', '1'], 'Spades' => ['K10', 'Q10', 'J10',
        '10', '9', '8', '7', '6', '5', '3', '2', '1'], 'Clubs' => 
        ['K10', 'Q10', 'J10', '10', '9', '8', '7', '6', '5', '3',
        '2', '1'], 'Diamond' => ['K10', 'Q10', 'J10', '10', '9', '8',
        '7', '6', '5', '3', '2', '1'] }.Freeze

BLACKJACK = 21.Freeze

public

def prompt(message)
  puts " => #{message}"
end

def deal(player)
  suit = Deck.keys.sample
  arr = Deck.values.sample
  card = arr.sample
  delete_from_deck(card, suit)
  card = ace_check(card, player)
  player << [suit, card]
  Deck[suit].delete_if { | _ , value| value == card }
end

def player_ace(card,player)
  prompt"You have an Ace"
  prompt"Is that an 11 or a 1?"
  answer = gets.chomp
    if answer == '1'
      card = 1
    else
      card = 11
    end
end

def ace_check(card, player)
  if card == '1' && player == play_h
    player_ace(card, player)
  elsif card == '1'
    if greater_than(11, add_hand(player))
      card = 11
    else
      card = 1
    end
  else
  return card
  end
end

def delete(arg)
  arg == nil?
end

def delete_from_deck(suit, card)
  Deck[suit].delete(card)
end

 # rubocop disable: AllCops
 
def add_hand(array) 
  array.flatten.delete_if { |word| word == "Hearts" || word == "Spades" ||
  word == "Clubs" || word == "Diamond" }.map { |num| num.to_i }.inject 
  { |num| num += }
end

 # rubocop enable: AllCops
 
def winner_check(human, computer)
x = 0
y = 0
case 
  when (x == 4 && bigger(human, computer) && !Busted?(human)) ||
    (Busted?(computer) && x == 4)
    prompt "You are the Winner!"
    return 8
  when
    (y == 4 && bigger(computer, human) && !Busted?(computer)) ||
    (Busted?(human) && y == 4)
    prompt "The Computer won that time."
    return 7
  when (bigger(human, computer) && !Busted?(human)) || Busted?(computer)
    prompt "Player Won"
    x += 1
  when (bigger(computer,human) && !Busted?(computer)) || Busted?(human)
    prompt "Computer Won"
    y += 1
  else
    prompt "Everybody loses.  Ante Up "
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
end

loop do

  prompt"Welcome to Black Jack!"

play_h = []
comp_h = []

deal(play_h)
deal(play_h)

prompt"You have #{play_h[0]} and #{play_h[1]}"

loop do
break if Busted?(play_h)
prompt"Stay or Hit?"
answer = gets.chomp
  case answer.downcase
    when 'hit'
      deal(play_h)
    when 'stay'
      break
    else
      prompt"Pick either Stay or Hit"
    end
prompt"You have #{play_h}"
end

deal(comp_h)
deal(comp_h)

prompt"Dealer has #{comp_h[0]} and #{comp_h[1]}"

loop do
case add_hand(comp_h)
  when (0..16)
    deal(comp_h)
  when (17..21)
    break
  when (21..35)
    prompt"Computer Busted"
    break
end
end

prompt"You had #{play_h}, the Computer had #{comp_h}"

break if winner_check(play_h, comp_h) == (7..8)

 # rubocop disable: AllCops
 
prompt"Do you want to Play again? Yes or No"
answer = gets.chomp
break if answer.downcase.split.first('n')
end
prompt"Thanks For Playing"
