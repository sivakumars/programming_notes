document.addEventListener('DOMContentLoaded', function() {
  var link = document.querySelector('a');
  var paragraph = document.querySelector('p');

  link.addEventListener('click', newGame);

  function newGame() {
    var answer = Math.floor(Math.random() * 100) + 1;
    var input = document.querySelector('#guess');
    var guesses = 0;
    var form = document.querySelector('form');
    paragraph.textContent = 'Guess a number from 1 to 100.'
    input.value = '';

    form.addEventListener('submit', function(event) {
      event.preventDefault();

      var guess = parseInt(input.value, 10);
      var message;

      guesses++;

      if (guess === answer) {
        message = 'You guessed it! It took you ' + guesses + ' guesses.';
      } else if (guess > answer) {
        message = 'My number is lower than ' + String(guess);
      } else {
        message = 'My number is higher than ' + String(guess);
      }

      paragraph.textContent = message;
    });
  }

  newGame();

});
