// Double Char Part 1
//
// Input: string
// Output: string
// Requirements:
// - repeat every charactr in the input string
// Algorithm:
// - Initialize output string
// - For each character in input string
//   - Append the cahracter twice to the ouput
// - Return ouput string

// function repeater(string) {
//   var result = '';
//
//   for (var i = 0; i < string.length; i++){
//     result += string[i].repeat(2);
//   }
//
//   return result;
// }
//
// console.log(repeater('Hello'));     // "HHeelllloo"
// console.log(repeater("Good job!")); // "GGoooodd  jjoobb!!"
// console.log(repeater(''));          // ''

// Double Char Part 2

// function doubleConsonants(string) {
//   var result = '';
//
//   for (var i = 0; i < string.length; i++){
//     result += string[i];
//
//     if (string[i].match(/[bcdfghjklmnpqrstvwxyz]/i)) {
//       result += string[i]
//     }
//   }
//
//   return result;
// }
//
// console.log(doubleConsonants('String'));       // "SSttrrinngg"
// console.log(doubleConsonants('Hello-World!')); // "HHellllo-WWorrlldd!"
// console.log(doubleConsonants('July 4th'));     // "JJullyy 4tthh"
// console.log(doubleConsonants(''));             // ""

// Convert numbers to reversed array of digits
//
// Input: number
// Output: number
// Requirements:
// - Return number with digits reversed
// Algorithm:
// - Convert input to string
// - Split string into array of chars
// - Reverise the array
// - Join the array back to a string
// - Conevrt stirng to number

// function reversedNumber(number) {
//   return Number(String(number).split('').reverse().join(''));
// }
//
// console.log(reversedNumber(12345)); // 54321
// console.log(reversedNumber(12213)); // 31221
// console.log(reversedNumber(456));   // 654
// console.log(reversedNumber(12000)); // 21 # Note that zeros get dropped!
// console.log(reversedNumber(1));     // 1

// Get The Middle Character
//
// Input: string
// Output: 1 or 2 characters (string)
// Requirements:
// - Return the middle characters
// - If odd, return middle character
// - If even return, 2 middle characters
// - Assume string is non-empty
// Algorithm:
// - Initialize output string
// - Get the middle characters index
//   - If odd, middleIndex = Math.floor(length/2)
//   - If even, middleIndex = length/2 and length/2 - 1
//   - Use slice to select characters
// - Return middleChars

// function centerOf(string) {
//   var middleChars;
//   var length = string.length;
//
//   if (length % 2 === 0) {
//     middleChars = string[length / 2 - 1] + string[length / 2]
//   } else {
//     middleChars = string[Math.floor(length / 2)];
//   }
//
//   return middleChars;
// }
//
// console.log(centerOf('I love ruby'));    // 'e'
// console.log(centerOf('Launch School'));  // ' '
// console.log(centerOf('Launch'));         // 'un'
// console.log(centerOf('Launchschool'));   // 'hs'
// console.log(centerOf('x'));             // 'x'

// Always Return Negative
//
// Input: number
// Output: negative number
// Requirements:
// - always return negative form of a number.
// - 0 should return -0
// - Negative numbers should stay the same
// Algorithm:
// - if a number is less than 0, return it
// - else, return it multiplied by -1

// function negative(number) {
//   return (number < 0) ? number : number * -1;
// }
//
// console.log(negative(5));  // -5
// console.log(negative(-3)); // -3
// console.log(negative(0));  // -0

// Counting Up
//
// Input: number
// Output: array
// Requirements:
// - Return an array of numbers from 1 to the input number
// - assume input is integer > 0

// function sequence(number) {
//   var array = [];
//
//   for (var i = 1; i <= number; i++) {
//     array.push(i);
//   }
//
//   return array;
// }
//
// console.log(sequence(5)); // [1, 2, 3, 4, 5]
// console.log(sequence(3)); // [1, 2, 3]
// console.log(sequence(1)); // [1]

// Name Swapping
//
// Input: string
// Output: string
// Requirements:
// - Given a string of two words separated by a space, return the second word, comma, first word

// function swapName(fullName) {
//   return fullName.split(' ')[1] + ', ' + fullName.split(' ')[0];
// }
//
// console.log(swapName('Joe Roberts')); // 'Roberts, Joe'

// Sequence Count
//
// Input: two integers
// Output: array
// Requirements:
// - return an array that contains the number of elements sepcified by the count (first integer)
// - the first element is the starting number (second integer), and subsequent elements are multiples of that element
// - assume that count is always positive, if 0, return empty list
//
// Algorithm:
// - Initialize result array
// - For loop from 1 to count
//   - push index * starting_number
// - Return result array

// function sequence(count, start) {
//   var result = [];
//
//   for (var i = 1; i <= count; i++) {
//     result.push(i * start);
//   }
//
//   return result;
// }

// console.log(sequence(5, 1));       // [1, 2, 3, 4, 5]
// console.log(sequence(4, -7));      // [-7, -14, -21, -28]
// console.log(sequence(3, 0));       // [0, 0, 0]
// console.log(sequence(0, 1000000)); // []

// Reverse It Part 1
//
// Input: string
// Output: string
// Requirements:
// - return string with words in reverse order
// Algorithm:
// - Split input string (on spaces) into array of words
// - Reverse array
// - Return array.join(' ');

// function reverseSentence(text) {
//   return text.split(' ').reverse().join(' ');
// }
//
// console.log(reverseSentence(''));                     // ''
// console.log(reverseSentence('Hello World'));          // 'World Hello'
// console.log(reverseSentence('Reverse these words'));  // 'words these Reverse'

// Reverse It Part 2
//
// Input: string
// Output: string
// Requirements:
// - return string with all chars reversed
// - preserve case
// - assume text contains only letters and spaces
// Algorithm:
// - Split text into array of words
// - Map each word in array
//   - if word length is 5 or greater, reverse the word
//   - else, return original word
// - Join and returnt the array

// function reverseWords(text) {
//   var words = text.split(' ');
//
//   var reversed = words.map(function(word){
//     if (word.length >= 5) {
//       return word.split('').reverse().join('');
//     } else {
//       return word;
//     }
//   });
//
//   return reversed.join(' ');
// }
//
// console.log(reverseWords('Professional'));          // lanoisseforP
// console.log(reverseWords('Walk around the block')); // Walk dnuora the kcolb
// console.log(reverseWords('Launch School'));         // hcnuaL loohcS
