document.addEventListener('DOMContentLoaded', function(event) {
  var guessButton = document.querySelector('input[type=submit]');
  var input = document.querySelector('#guess');
  var prompt = document.querySelector('p');
  var newGameLink = document.querySelector('a');
  var answer;
  var guesses;

  function newGame() {
    answer = Math.floor(Math.random()*100) + 1;
    guesses = 0;
    console.log(answer);

    prompt.textContent = 'Guess a number between 1 and 100.';

    guessButton.addEventListener('click', function(event) {
      event.preventDefault();

      var guess = parseInt(input.value, 10);
      var message;
      guesses++;

      if (answer === guess) {
        message = 'You guessed it! It took ' + String(guesses) + ' guesses';
      } else if (answer > guess) {
        message = 'My number is higher than ' + String(guess);
      } else {
        message = 'My number is lower than ' + String(guess);
      }

      prompt.textContent = message;
    });
  }

  newGameLink.addEventListener('click', newGame);

  newGame();


});
