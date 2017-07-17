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
