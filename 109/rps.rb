class Move
  attr_accessor :value
  VALUES = %w(rock paper scissors).freeze

  def initialize(value)
    @value = value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end

  protected

  def scissors?
    value == 'scissors'
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose: #{Move::VALUES.join(', ')}"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "That's not a valid choice."
    end
    self.move = Move.new(choice)
  end

  private

  def set_name
    name = ''
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "You must enter a name."
    end
    self.name = name
  end
end

class Computer < Player
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  private

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Rock-Paper-Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won the round!"
    elsif human.move < computer.move
      puts "#{computer.name} won the round!"
    else
      puts "The round was a tie."
    end
  end

  def play_again?
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp
    return true if answer.downcase.start_with?('y')
  end
end

RPSGame.new.play
