require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
FIRST_MOVE = 'choose'.freeze
MIDDLE_SQUARE = 5.freeze
SERIES_WIN_TOTAL = 5.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  elsif current_player == 'computer'
    'player'
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(brd)}."
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if winning_play?(brd)
             winning_square(brd)
           elsif immediate_threat?(brd)
             threatened_square(brd)
           elsif brd[MIDDLE_SQUARE] == INITIAL_MARKER
             MIDDLE_SQUARE
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def winning_play?(brd)
  !!winning_square(brd)
end

def winning_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line[brd.values_at(*line).index(INITIAL_MARKER)]
    end
  end
  nil
end

def immediate_threat?(brd)
  !!threatened_square(brd)
end

def threatened_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line[brd.values_at(*line).index(INITIAL_MARKER)]
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def someone_won_series?(player_score, computer_score)
  !!detect_series_winner(player_score, computer_score)
end

def update_score(player_score, computer_score, winner)
  if winner == 'Player'
    player_score += 1
  elsif winner == 'Computer'
    computer_score += 1
  end
  [player_score, computer_score]
end

def detect_series_winner(player_score, computer_score)
  if player_score == SERIES_WIN_TOTAL
    return 'Player'
  elsif computer_score == SERIES_WIN_TOTAL
    return 'Computer'
  end
  nil
end

def joinor(arr, delimeter = ', ', word = 'or')
  choices = ""
  empty_squares = empty_squares(arr)
  empty_squares.each_with_index do |square, index|
    choices += if empty_squares.size == 1
                 "#{square}"
               elsif index < empty_squares.size - 1
                 "#{square}#{delimeter}"
               else
                 "#{word} #{square}"
               end
  end
  choices
end

loop do # main loop
  player_score = 0
  computer_score = 0

  loop do # play_again loop
    board = initialize_board
    current_player = ''

    if FIRST_MOVE == 'choose'
      loop do
        prompt "Who should go first: player (P) or computer (C)?"
        first_input = gets.chomp

        current_player = if first_input.downcase.start_with?('p')
                           'player'
                         elsif first_input.downcase.start_with?('c')
                           'computer'
                         end

        break if first_input.downcase.start_with?('p', 'c')
        prompt "That's not a valid choice."
      end
    elsif FIRST_MOVE == 'player'
      current_player = 'player'
    elsif FIRST_MOVE == 'computer'
      current_player = 'computer'
    end

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won the game!"
      player_score, computer_score =
        update_score(player_score, computer_score, detect_winner(board))
    else
      prompt "It's a tie!"
    end

    prompt "Score -- Player: #{player_score}; Computer: #{computer_score}"

    if someone_won_series?(player_score, computer_score)
      prompt "#{detect_series_winner(player_score, computer_score)} won the series!"
      break
    end

    prompt "Hit ENTER to start next game in series."
    gets.chomp
  end

  prompt "Do you want to play another series?"
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt "Thanks for playing!"
