// Requirements:
// - implement the caesar cipher
// - input: plaintext (string), key (integer)
// - output: ciphertext (string)
// - given a key value, shift each letter to the right that number of places
// - only encrypt letters; all other chars are left as-is
// - case should be preserved; lowercase --> lowercase, uppercase --> uppercase
// - Can the key be negative?
//
// Data Structure:
// - Array for input string: so that I can split the string and shift each char individually
// - Array for alphabet: to shift within alphabet and wrap around
//
// Algorithm:
// - Create array of all lowercase letters
// - Create array of all uppercase letters
// - Split the input into an array of chars
// - Initialize result array
// - Iterate through chars
//   - If the char matches uppercase
//     - Find the index of the char in the uppercase array
//     - Add key to the index
//     - Take result % 26
//     - Find letter at that key
//   - If lowercase, do same thing
//   - Else, return char
// - Join result array into string

function caesarEncrypt(plaintext, key) {
  var UPPERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  var LOWERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.toLowerCase().split('');

  var result = plaintext.split('').map(function(char) {
    if (char.match(/[A-Z]/)) {
      var index = UPPERS.indexOf(char);
      var keyIndex = (index + key) % 26;
      return UPPERS[keyIndex];
    } else if (char.match(/[a-z]/)) {
      var index = LOWERS.indexOf(char);
      var keyIndex = (index + key) % 26;
      return LOWERS[keyIndex];
    } else {
      return char;
    }
  });

  return result.join('');

}

console.log(caesarEncrypt('A', 0));    // 'A'
console.log(caesarEncrypt('a', 0));    // 'a'
console.log(caesarEncrypt('z', 2));    // 'b'

console.log(caesarEncrypt('ABC', 4));  // 'EFG'

console.log(caesarEncrypt('783 ! db 45', 26)); //'783 ! db 45'

console.log(caesarEncrypt('a', 47));      // 'v'

console.log(caesarEncrypt('', 47));      // ''
