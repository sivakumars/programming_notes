VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("Computer won the round!")
  else
    prompt("This round was a tie.")
  end
end

def check_for_declare_winner(player_score, computer_score)
  if player_score >= 5
    prompt("You are the first to 5. Congratulations!")
  elsif computer_score >= 5
    prompt("Oh no! The computer was the first to 5.")
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  player_score += 1 if win?(choice, computer_choice)
  computer_score += 1 if win?(computer_choice, choice)

  prompt("Player: #{player_score}; Computer: #{computer_score}")

  check_for_declare_winner(player_score, computer_score)
  break if player_score == 5 || computer_score == 5

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing!")
