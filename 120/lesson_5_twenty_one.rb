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

  def deal_two_cards(player)
    2.times { player.hand << cards.delete(cards.sample) }
  end
end

class Participant
  BUST_TOTAL = 21

  attr_accessor :hand

  def initialize
    @hand = []
  end

  def busted?
    hand_value > BUST_TOTAL
  end

  def hide_first_card
    hidden_hand = hand.clone
    hidden_hand[0] = ['?', '?']
    hidden_hand
  end

  def hit(deck)
    hand << deck.cards.delete(deck.cards.sample)
  end

  def display_hand(options = { hide_first_card: false })
    if options[:hide_first_card]
      puts "#{self.class} Hand: #{hide_first_card}"
    else
      puts "#{self.class} Hand: #{hand} --> #{hand_value}"
    end
  end

  def hand_value
    total = 0
    sort_aces_for_evaluation.each do |card|
      case card[0]
      when 'J', 'Q', 'K'
        total += 10
      when 'A'
        total += 11
      else
        total += card[0].to_i
      end
    end
    total
  end

  private

  def sort_aces_for_evaluation
    eval_hand = hand.clone
    hand.each do |card|
      if card[0] == 'A'
        eval_hand.delete(card)
        eval_hand.push(card)
      end
    end
    eval_hand
  end

  def determine_ace_value(hand_value)
    hand_value + 11 > BUST_TOTAL ? 1 : 11
  end
end

class Player < Participant
end

class Dealer < Participant
end

class TwentyOne
  DEALER_STAY_TOTAL = 17

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def deal_cards
    print "Hit Enter to deal cards!"
    gets
    @deck.deal_two_cards(@player)
    @deck.deal_two_cards(@dealer)
  end

  def display_hands(options = { hide_dealer_card: false })
    puts ""
    if options[:hide_dealer_card]
      @dealer.display_hand(hide_first_card: true)
    else
      @dealer.display_hand
    end
    @player.display_hand
    puts ""
  end

  def player_turn
    loop do
      display_hands(hide_dealer_card: true)
      answer = nil

      loop do
        print "Your Turn: hit (H) or stay (S)? "
        answer = gets.chomp.downcase
        break if ['h', 's'].include?(answer)
        puts "That's not a valid choice!"
      end

      @player.hit(@deck) if answer == 'h'
      break if answer == 's' || @player.busted?
    end
  end

  def display_player_result
    if @player.busted?
      display_hands
      puts "You busted! Dealer wins."
    else
      puts "You stayed. It's the dealer's turn."
    end
  end

  def dealer_turn
    loop do
      display_hands
      break if @dealer.hand_value >= DEALER_STAY_TOTAL
      sleep 3
      @dealer.hit(@deck)
      puts "Dealer hits."
    end
  end

  def display_dealer_result
    if @dealer.busted?
      puts "Dealer busted! You win!"
    elsif @player.hand_value > @dealer.hand_value
      puts "Dealer must stay! You win!"
    elsif @player.hand_value < @dealer.hand_value
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
    unless @player.busted?
      dealer_turn
      display_dealer_result
    end
    display_goodbye_message
  end
end

game = TwentyOne.new
game.play
