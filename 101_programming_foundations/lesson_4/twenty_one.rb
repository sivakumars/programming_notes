# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

SUITS = %w[H S D C]
CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A]

# def initialize_deck
#   new_deck = {}
#   SUITS.each do |suit|
#     new_deck[suit] = (2..10).to_a + FACE_CARDS
#   end
# end

def prompt(msg)
  puts ""
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = []
  SUITS.each do |suit|
    CARDS.each do |card|
      new_deck << [suit, card]
    end
  end
  new_deck
end

def deal_cards!(deck, number_cards = 1)
  cards = []
  number_cards.times do
    cards << deck.delete(deck.sample)
  end
  cards
end

def display_hands(player_hand, dealer_hand)
  dealer_show = []
  dealer_hand.each_index { |element| dealer_show << dealer_hand[element] }
  dealer_show[0] = ['X','X']
  puts "====> Dealer's Hand: #{dealer_show} <===="
  puts "====> Your Hand: #{player_hand} <===="
end

def busted?(player_hand)
  hand_value = 0
  player_hand.each do |card|
    hand_value += case card[1]
                  when '2'
                    2
                  when '3'
                    3
                  when '4'
                    4
                  when '5'
                    5
                  when '6'
                    6
                  when '7'
                    7
                  when '8'
                    8
                  when '9'
                    9
                  when '10' || 'J' || 'Q' || 'K'
                    10
                  when 'A'
                    evaluate
                  end
  end
end

prompt "Welcome to Twenty-One!"
prompt "Hit Enter to deal!"
gets.chomp

deck = initialize_deck

player_hand = []
dealer_hand = []

player_hand = deal_cards!(deck, 2)
dealer_hand = deal_cards!(deck, 2)

display_hands(player_hand, dealer_hand)

loop do
  prompt "Your Turn: hit (H) or stay (S)?"
  answer = gets.chomp
  player_hand = deal_cards!(deck) if answer.downcase.start_with?('h')
  break if answer.downcase.start_with('s') || busted?(player_hand)
end

if busted?(player_hand)
  prompt "You busted! Dealer wins."
else
  prompt "You stayed. Dealer's turn."
end
