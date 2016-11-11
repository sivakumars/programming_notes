SUITS = %w(H S D C).freeze
CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze

def prompt(msg)
  puts ""
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = []
  CARDS.each do |card|
    SUITS.each do |suit|
      new_deck << [card, suit]
    end
  end
  new_deck
end

def deal_card!(deck, hand)
  hand << deck.delete(deck.sample)
end

def display_hands(player_hand, dealer_hand, hidden = 0)
  dealer_show = []
  dealer_hand.each_index { |element| dealer_show << dealer_hand[element] }
  dealer_show[0] = ['X', 'X']
  if hidden == 1
    puts ""
    prompt "Dealer's Hand: #{dealer_show} --> #{hand_value(dealer_show)}"
  else
    prompt "Dealer's Hand: #{dealer_hand} --> #{hand_value(dealer_hand)}"
  end
  prompt "Your Hand: #{player_hand} --> #{hand_value(player_hand)}"
end

def busted?(player_hand)
  if hand_value(player_hand) > 21
    true
  else
    false
  end
end

def sort_hand_for_evaluation(hand)
  hand.each do |card|
    if card[0] == 'A'
      hand.delete(card)
      hand.push(card)
    end
  end
  hand
end

def hand_value(hand)
  sorted_hand = []
  hand.each_index { |element| sorted_hand << hand[element] }
  sort_hand_for_evaluation(sorted_hand)

  hand_value = 0
  sorted_hand.each do |card|
    case card[0]
    when '10', 'J', 'Q', 'K'
      hand_value += 10
    when 'A'
      hand_value += ace_value(hand_value)
    else
      hand_value += card[0].to_i
    end
  end
  hand_value
end

def ace_value(hand_value)
  hand_value + 11 > 21 ? 1 : 11
end

def someone_won?(player_hand, dealer_hand)
  !!detect_winner(player_hand, dealer_hand)
end

def detect_winner(player_hand, dealer_hand)
  if hand_value(dealer_hand) > 21
    prompt "Dealer busted! You win!"
  elsif hand_value(player_hand) > hand_value(dealer_hand)
    prompt "You win!"
  elsif hand_value(dealer_hand) > hand_value(player_hand)
    prompt "Dealer stays. Dealer wins!"
  else
    prompt "It's a tie!"
  end
end

prompt "Welcome to Twenty-One!"

loop do
  prompt "Hit Enter to deal cards!"
  gets.chomp

  deck = initialize_deck

  player_hand = []
  dealer_hand = []

  2.times do
    deal_card!(deck, player_hand)
    deal_card!(deck, dealer_hand)
  end

  loop do
    display_hands(player_hand, dealer_hand, 1)
    prompt "Your Turn: hit (H) or stay (S)?"
    answer = gets.chomp
    deal_card!(deck, player_hand) if answer.downcase.start_with?('h')
    break if answer.downcase.start_with?('s') || busted?(player_hand)
  end

  if busted?(player_hand)
    display_hands(player_hand, dealer_hand)
    prompt "You busted! Dealer wins."
  else
    prompt "You stayed. It's the dealer's turn."
    loop do
      display_hands(player_hand, dealer_hand)
      break if hand_value(dealer_hand) >= 17
      sleep 5
      deal_card!(deck, dealer_hand)
      prompt "Dealer hits."
    end
    detect_winner(player_hand, dealer_hand)
  end

  prompt "Do you want to play again?"
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt "Thanks for playing!"
