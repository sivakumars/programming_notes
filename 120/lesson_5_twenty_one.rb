class Deck
  CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  SUITS = %w(H S D C).freeze

  attr_reader :cards

  def initialize
    @cards = new_deck
  end

  def new_deck
    cards = []
    CARDS.each do |card|
      SUITS.each do |suit|
        cards << [card, suit]
      end
    end
    cards
  end

  def deal(player, number_of_cards = 1)
    number_of_cards.times do
      player.hand.cards << cards.delete(cards.sample)
    end
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def value(hide_card = false)
    eval_hand = hide_card ? sort_aces(cards_first_hidden) : sort_aces(cards)

    total = 0
    eval_hand.each do |card|
      case card[0]
      when 'J', 'Q', 'K'
        total += 10
      when 'A'
        total += determine_ace_value(total)
      else
        total += card[0].to_i
      end
    end
    total
  end

  def cards_first_hidden
    cards_first_hidden = cards.drop(1)
    cards_first_hidden.unshift(['?', '?'])
  end

  def display(hide_card = false)
    if hide_card
      cards_first_hidden
    else
      cards
    end
  end

  private

  def sort_aces(cards)
    eval_hand = cards.clone
    cards.each do |card|
      if card[0] == 'A'
        eval_hand.delete(card)
        eval_hand.push(card)
      end
    end
    eval_hand
  end

  def determine_ace_value(value)
    value + 11 > Player::BUST_TOTAL ? 1 : 11
  end
end

class Player
  BUST_TOTAL = 21

  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

  def busted?
    hand.value > BUST_TOTAL
  end
end

class TwentyOne
  DEALER_STAY_TOTAL = 17

  attr_accessor :deck, :player, :dealer

  def initialize
    @player = Player.new
    @dealer = Player.new
    @deck = Deck.new
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
    puts ""
  end

  def display_goodbye_message
    puts ""
    puts "Thanks for playing!"
  end

  def deal_cards
    print "Hit Enter to deal cards!"
    gets
    deck.deal(player, 2)
    deck.deal(dealer, 2)
  end

  def display_hands(hide_card = false)
    puts ""
    puts "Dealer Hand: #{dealer.hand.display(hide_card)} --> #{dealer.hand.value(hide_card)}"
    puts "Player Hand: #{player.hand.display} --> #{player.hand.value}"
    puts ""
  end

  def player_turn
    loop do
      display_hands(true)
      answer = nil

      loop do
        print "Your Turn: hit (H) or stay (S)? "
        answer = gets.chomp.downcase
        break if ['h', 's'].include?(answer)
        puts "That's not a valid choice!"
      end

      deck.deal(player) if answer == 'h'
      break if answer == 's' || player.busted?
    end
  end

  def display_player_result
    if player.busted?
      display_hands(true)
      puts "You busted! Dealer wins."
    else
      puts "You stayed. It's the dealer's turn."
    end
  end

  def dealer_turn
    loop do
      display_hands
      break if dealer.hand.value >= DEALER_STAY_TOTAL
      puts "Dealer hits."
      sleep 3
      deck.deal(dealer)
    end
  end

  def display_dealer_result
    if dealer.busted?
      puts "Dealer busted! You win!"
    elsif player.hand.value > dealer.hand.value
      puts "Dealer must stay! You win!"
    elsif player.hand.value < dealer.hand.value
      puts "Dealer wins!"
    else
      puts "It's a tie!"
    end
  end

  def play
    system 'clear'
    display_welcome_message
    deal_cards
    player_turn
    display_player_result
    unless player.busted?
      dealer_turn
      display_dealer_result
    end
    display_goodbye_message
  end
end

game = TwentyOne.new
game.play
