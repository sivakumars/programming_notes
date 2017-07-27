// 1000 Lights
//
// Input: number of switches (n)
// Output: array of numbers (possible values 1 to n)
// Requirements:
// - Given n switches initially set to "off"
// - You iterate through the switches n times
// - The first time you flip every switch, the second time you flip every 2nd swtich, the third time every 3rd switch, and so on, until you reach n times
// - return the array of switches set to "on" after n repetitions
//
// 1st pass: 1y 2y 3y 4y 5y
// 2nd pass: 1y 2n 3y 4n 5y
// 3rd pass: 1y 2n 3n 4n 5y
// 4th pass: 1y 2n 3n 4y 5y
// 5th pass: 1y 2n 3n 4y 5n
//
// Therefore: 1, 4
//
// Data Structure:
// - Array - don't want to add and remove elements in the array
// - Object - more complex with parts but simpler to understand
//
// Algorithm:
// - Initialize an object with numbers 1 to n for keys and false for values
// - Iterate on i from 1 to n:
//   - Start at switchNum = 1;
//   - While (switchNum <= numSwitches),
//     - Flip object[switchNum]
//     - switchNum += i
// - Return object.keys filtered for true values

// Algorithm (using array as data structure):
// - Create an array and set indices from 1 to n as false
// - Loop from 1 to n (i)
//   - toggle the lights whose indexes are multiples of i
//   - use map to return a new array with the new toggled states each iteration
// - Filter array to return indexes of true values

// function lightsOn(numSwitches) {
//   var result = [];
//   var lights = new Array(numSwitches).fill(false);
//
//   for (var i = 1; i <= numSwitches; i++) {
//     lights = lights.map(function(light, index) {
//       if ((index + 1) % i === 0) {
//         return !light;
//       } else {
//         return light;
//       }
//     });
//   }
//
//   for (var i = 0; i < numSwitches; i++) {
//     if (lights[i]) {
//       result.push(i+1);
//     }
//   }
//
//   return result;
// }

// function lightsOn(numSwitches) {
//   var lights = {};
//
//   for (var i = 1; i <= numSwitches; i++) {
//     lights[i] = false;
//   }
//
//   for (var i = 1; i <= numSwitches; i++) {
//     var switchNum = i;
//
//     while (switchNum <= numSwitches) {
//       lights[switchNum] = !lights[switchNum];
//       switchNum += i;
//     }
//   }
//
//   var result = [];
//
//   Object.keys(lights).forEach(function(key) {
//     if (lights[key]) {
//       result.push(key);
//     }
//   });
//
//   return result;
// }

// console.log(lightsOn(5));    // [1, 4]
// console.log(lightsOn(100));  // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

// Diamonds
//
// Input: odd integer
// Output: logged * to console
// Requirements:
// - write a function that takes odd integer input
// - n x n grid of asterisks and spaces
//
// diamond(1):
// 0 spaces, 1 asterisk, 0 spaces
//
// diamond(3):
// 1 space, 1 asterisk, 1 space
// 0 spaces, 3 asterisk, 0 spaces
// 1 space, 1 asterisk, 1 space
//
// diamond(5):
// 2 spaces, 1 asterisk, 2 spaces
// 1 space, 3 asterisks, 1 space
// 0 spaces, 5 asterisks, 0 spaces
// 1 space, 3 asterisks, 1 space
// 2 spaces, 1 asterisk, 2 spaces
//
// diamond(n):
// floor(n/2) spaces, 1 asterisk,
// floor(n/2) - 1 spaces, 3 asterisks
//
// Algorithm:
// - Loop from 1 to n (not including n):
//   - Set asterisks = 1
//   - Set spaces = (n - asterisks) / 2
//   - Log spaces + asterisks + spaces
//   - Increment asterisks by 2
// - Loop from n to 1:
//   - Set asterisks = n
//   - Set spaces = n - asterisks / 2
//   - Log spaces + asterisks + spaces
//   - Decrement asterisks by 2

// function diamond(n) {
//   for (var i = 1; i < n; i += 2) {
//     printStars(n, i);
//   }
//
//   for (var i = n; i > 0; i -= 2) {
//     printStars(n, i);
//   }
// }
//
// function printStars(lineLength, numStars) {
//   var numSpaces = (lineLength - numStars) / 2;
//   console.log(' '.repeat(numSpaces) + '*'.repeat(numStars));
// }
//
// diamond(1);
// diamond(3);
// diamond(9);

// Now I Know My ABCs
//
// Input: string
// Output: boolean
// Requirements:
// - Given a list of letter-pairs, if the input word can be spelled by using each pair just once, return true; otherwise, return false
// - case doesnt matter
//
// Algorithm:
// - Given a constant array of pairs --> ['bo', 'gt'...]
// - Create usedPairs array
// - Split word into array of chars
// - Loop through each char:
//   - Create regex of char
//   - Loop through used pairs:
//     - If any of pairs match regex, return false
//   - Loop through constant pairs:
//     - if any of the pairs match regex, push pair to usedPairs
// - If loop completes, return true


// function isBlockWord(word) {
//   var blocks = ['bo', 'gt', 'vi', 'xk', 're', 'ly', 'dq', 'fs', 'zm', 'cp', 'jw', 'na', 'hu'];
//   var usedPairs = [];
//   var chars = word.toLowerCase().split('');
//
//   for (var i = 0; i < chars.length; i++) {
//
//     for (var j = 0; j < blocks.length; j++) {
//         var matchingBlock = -1;
//       if (blocks[j].indexOf(chars[i]) > -1) {
//           matchingBlock = blocks.indexOf(blocks[j]);
//           break;
//         }
//     }
//
//     if (matchingBlock < 0) {
//       return false;
//     } else {
//       blocks.splice(matchingBlock, 1);
//     }
//   }
//   return true;
// }
//
// console.log(isBlockWord('BATCH')); // true
// console.log(isBlockWord('BUTCH')); // false
// console.log(isBlockWord('jest'));  // true
// console.log(isBlockWord('floW'));  // true
// console.log(isBlockWord('APPLE')); // false
// console.log(isBlockWord('apple')); // false
// console.log(isBlockWord('apPLE')); // false
// console.log(isBlockWord('Box'));   // false

// Caesar Cipher
//
// Input: encrypted text (string) and key (number)
// Output: decrypted text (string)
// Requirements:
// - given encrypted text, use the key to decrypt
// - each alphabetic letter in the text should be shifted to the right by the number of letters indicated by the key
// - lowercase letters should remain lowercase; uppercase remain uppercase
// - dont substitute non-alphabetic chars
// - should support shifting more than 26 characters (use key % 26)
// - the shift can wrap around the alphabet (e.g. 'y' (3) --> z a b --> 'b')
//
// Questions:
// - Can the key be negative? (no)
//
// Algorithm:
// - Create uppercase and lowercase alphabet strings
// - Split input string into array of chars ['a' , 'b', 'c']
// - Create new results array
// - Loop through array of chars:
//   - If lowercase letter:
//     - Find chars index in lowercase string
//     - Add key to index
//     - Grab remainder of result % 26
//     - Push value of letter at that remainder index in lowercase string to new array
//   - If uppercase letter:
//     - Repeat 4 steps above for uppercase
//   - Else
//     - Push char to array
// - Return joined results array

function caesarEncrypt(text, key) {
  var UPPERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var LOWERS = UPPERS.toLowerCase();

  return text.split('').map(function(char) {
    if (char.match(/[a-z]/)) {
      return LOWERS[(LOWERS.indexOf(char) + key) % 26]
    } else if (char.match(/[A-Z]/)) {
      return UPPERS[(UPPERS.indexOf(char) + key) % 26]
    } else {
      return char;
    }
  }).join('');
}
//
// // Simple shift
// console.log(caesarEncrypt('A', 0));       // 'A'
// console.log(caesarEncrypt('A', 3));       // 'D'
//
// // Wrap around
// console.log(caesarEncrypt('y', 5));       // 'd'
// console.log(caesarEncrypt('a', 47));      // 'v'
//
// // All letters
// console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// // ZABCDEFGHIJKLMNOPQRSTUVWXY
// console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// // Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!
//
// // Many non-letters
// console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
// // Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?
//
// console.log(caesarEncrypt('', 5)); // ''
// console.log(caesarEncrypt('abc', 26)); // 'abc'

// Vigenere Cipher
//
// Input: text (string); keyword (string)
// Output: text (string)
// Requirements:
// - Implement the vigenere cipher
// - Encrypts words like the Caesar cipher but the key changes for each character in the text
// - Instead of a key, a keyword is given, which can be mapped to an array of keys
// - For each alphabetic letter in the text, a key is picked from the array of keys and used to apply the caesar cipher
// - The next letter to be encrypted uses the next key in the array; the array is rotated through and when the end of the array is reached, the first key in the array is used again
// - Like the Caesar cipher, only alphabetic letters are encrypted
//
// Algorithm:
// - Convert string to uppercase, split the keyword into array of chars
// - Map the array of chars --> array of indexes
//     - Use char to find letterIndex in letters array
//     - Return letterIndex
// - Set ciphertext = '';
// - Set keywordIndex = 0;
// - Loop on array of chars:
//   - caesarEncrypt(char, keywords[keywordIndex]);
//   - Concatenate result to ciphertext
//   - if char is a letter:
//     - if index === keyword.length - 1, set it to 0, otherwise increment it by 1
// - Return ciphertext

// function vigenereEncrypt(text, keyword) {
//   var UPPERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//   var LOWERS = UPPERS.toLowerCase();
//   var ciphertext = ''
//   var keyPos = 0;
//
//   var keys = keyword.toUpperCase().split('').map(function(keyChar) {
//     return UPPERS.indexOf(keyChar);
//   });
//
//   text.split('').forEach(function(char) {
//     if (char.match(/[a-z]/)) {
//       ciphertext += LOWERS[(LOWERS.indexOf(char) + keys[keyPos]) % 26];
//       keyPos = (keyPos + 1) % keys.length;
//     } else if (char.match(/[A-Z]/)) {
//       ciphertext += UPPERS[(UPPERS.indexOf(char) + keys[keyPos]) % 26];
//       keyPos = (keyPos + 1) % keys.length;
//     } else {
//       ciphertext += char;
//     }
//   });
//
//   return ciphertext;
// }
//
//
// console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'meat')); // Bmnxmtpeqw dhz'x gh ar pbldal!
// console.log(vigenereEncrypt("Pineapples dont go on pizzas", 'MeaT')); // Bmnxmtpeqw dhzx gh ar pbldal
// console.log(vigenereEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 'cCc')); // Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?

// Seeing Stars
//
// Input: numStars (number)
// Output: logged 8-pointed star (string)
// Requirements:
// - display an 8 pointed star in an n x n grid
// - n is an odd integer >= 7
//
// star(7):
// 0 spaces, 1 stars, 2 spaces, 1 stars, 2 spaces, 1 stars, 0 spaces
// 1 spaces, 1 stars, 1 spaces, 1 stars, 1 spaces, 1 stars, 1 spaces
// 2 spaces, 1 stars, 0 spaces, 1 stars, 0 spaces, 1 stars, 2 spaces
//
// star(9):
// 0 spaces, 1 stars, 3 spaces, 1 stars, 3 spaces, 1 stars, 0 spaces
// 1 spaces, 1 stars, 2 spaces, 1 stars, 2 spaces, 1 stars, 1 spaces
// 2 spaces, 1 stars, 1 spaces, 1 stars, 1 spaces, 1 stars, 2 spaces
// 3 spaces, 1 stars, 0 spaces, 1 stars, 0 spaces, 1 stars, 3 spaces
//
// 0 spaces, 1 stars, floor(n/2) - 1 spaces, 1 stars, floor(n/2) - 1 spaces, 1 stars, 0 spaces
//
// Algorithm:
// - Set secondGap = Math.floor(n/2) - 1;
// - Set firstGap = 0;
// - While(secondGap >= 0)
//   - Print firstGap spaces + 1 star + secondGap spaces + 1 star + secondGap spaces + 1 star
//   - Decrement secondGap by 1
//   - Increment firstGap by 1
// - Print n stars
// - While (firstGap >= 0)
//   - Print firstGap spaces + 1 star + secondGap spaces + 1 star + secondGap spaces + 1 star
//   - Increment secondGap by 1
//   - Decremebt firstGame by 1

function star(n) {
  var secondGap = Math.floor(n / 2) - 1;
  var firstGap = 0;

  while (secondGap >= 0) {
    console.log(' '.repeat(firstGap) + '*' + ' '.repeat(secondGap) + '*' + ' '.repeat(secondGap) + '*');
    secondGap--;
    firstGap++;
  }

  console.log('*'.repeat(n));

  firstGap = Math.floor(n / 2) - 1;
  secondGap = 0;

  while (firstGap >= 0) {
    console.log(' '.repeat(firstGap) + '*' + ' '.repeat(secondGap) + '*' + ' '.repeat(secondGap) + '*');
    secondGap++;
    firstGap--;
  }
}

console.log(star(7));
console.log(star(9));
