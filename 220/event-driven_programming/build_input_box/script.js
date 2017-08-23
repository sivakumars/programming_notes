document.addEventListener('DOMContentLoaded', function(event) {
  var textField = document.querySelector('.text-field');
  var content = document.querySelector('.content');
  var intervalID;
  var focusedTextField = false;

  textField.addEventListener('click', function(event) {
    event.stopPropagation();
    textField.classList.add('focused');

    intervalID = setInterval(function() {
      textField.classList.toggle('cursor');
    }, 500);

    focusedTextField = true;
  });

  document.addEventListener('keypress', function(event) {
    if (focusedTextField) {
      content.textContent += event.key;
    }
  });

  document.addEventListener('keyup', function(event) {
    if (focusedTextField && event.which === 8) {
      content.textContent = content.textContent.slice(0, -1)
    }
  });

  document.addEventListener('click', function(event) {
    clearInterval(intervalID);
    textField.classList.remove('focused');
    textField.classList.remove('cursor');
    focusedTextField = false;
  });

});



// Setup:
// Add 'click' event listener to text-field
// Add 'click' event listener to document
//
// Behavior: When text-field is clicked:
// - Event fires on text-field:
//   - If text-field has an event handler, code runs
// - Event bubbles and is fired on document
//   - If document has an event handler, code runs
//
// Behavior: When document is clicked:
// - Event fires on document:
//   - If document has an event handler, code runs
