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
<<<<<<< HEAD
  Deck[suit].delete_if { | _ , value| value == card }
end

def player_ace(card,player)
  prompt"You have an Ace"
  prompt"Is that an 11 or a 1?"
  answer = gets.chomp
=======
  Deck[suit].delete_if{|key, value| value == card}  #This was not working correctly on my system
end

def ace_check(card, player) 
  if card == '1' && player == play_h  # I was having trouble establishing a variable to call here
    prompt"You have an Ace"           # it does work if you remove the  player == play_h component
    prompt"Is that an 11 or a 1?"     
    answer= gets.chomp
>>>>>>> 31fcc07885aaafeb519d07046c1d2c5120a0c9e2
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

<<<<<<< HEAD
def delete(arg)
  arg == nil?
end
=======
def delete(arg)  #Had to make this for my argument to work on my local
  arg == nil     #system it was returing the numbers fine but when I moved this
end              #file to cloud 9 it was returning a nil value for the card.
>>>>>>> 31fcc07885aaafeb519d07046c1d2c5120a0c9e2

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
<<<<<<< HEAD
  when (bigger(human, computer) && !Busted?(human)) || Busted?(computer)
    prompt "Player Won"
    x += 1
  when (bigger(computer,human) && !Busted?(computer)) || Busted?(human)
=======
  elsif (bigger(human, computer) && !Busted?(human)) || Busted?(computer)
    prompt "Player Won"
    x += 1
  elsif (bigger(computer,human) && !Busted?(computer)) || Busted?(human)
>>>>>>> 31fcc07885aaafeb519d07046c1d2c5120a0c9e2
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

play_h = []       #To get my ace_check method to work I pulled these variables out of the loop 
comp_h = []       #it still allowed the program to run but I still couldn't call play_h from
                  # ace_check.
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
