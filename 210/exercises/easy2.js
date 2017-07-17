// Ddaaiillyy ddoouubbllee
//
// Input: string
// Output: string
// Requirements:
// - if there are 2 or more repeating characters, remove the repeating chars
// - empty string should return empty string
//
// Algorithm:
// - If string is empty, return empty
// - Initialize new string to first char
// - For each character in the string, starting at 2nd char
//   - If current char is equal to previous char:
//     - continue to next iteration
//   - Else:
//     - Append to new string
// - Return new string

// console.log(crunch('ddaaiillyy ddoouubbllee'));        // 'daily double'
// console.log(crunch('4444abcabccba'));                  // '4abcabcba'
// console.log(crunch('ggggggggggggggg'));                // 'g'
// console.log(crunch('a'));                              // 'a'
// console.log(crunch(''));                               // ''
//
// function crunch(str) {
//   var newStr = '';
//
//   for (var i = 0; i < str.length; i++) {
//     if (str[i] !== str[i - 1]) {
//       newStr += str[i];
//     }
//   }
//
//   return newStr;
// }

// Bannerizer
//
// Input: text (string)
// Output: log to console (string)
// Requirements:
// - Empty string should return base border: +, -, | (see test case)
// - Additional top and bottom dashes should match number of characters in text
// - Assume output will always fit in browser window
// Algorithm:
// - Assign length of text to a variable
// - Assign line1 to a '+'  ('-' * length of text + 2) '+'
// - Assign line2 to a '|' (' ' * length of text + 2)
// - Assign line3 to a '|' ' ' text ' ' '|'
// - Console log line1, line2, line3, line2, line1

// function logInBox(text) {
//   var len = text.length;
//   var borderLine = '+' + '-'.repeat(len + 2) + '+';
//   var emptyLine = '|' + ' '.repeat(len + 2) + '|';
//   var textLine = '|' + ' ' + text + ' ' + '|';
//
//   console.log(borderLine);
//   console.log(emptyLine);
//   console.log(textLine);
//   console.log(emptyLine);
//   console.log(borderLine);
// }
//
// logInBox('To boldly go where no one has gone before.');
// logInBox('');

// Stringy Strings
//
// Input: numberOfBits (number)
// Output: 1s and 0s (string)
// Requirements:
// - input is positive integer
// - output string should start with '1' and alternate between '0' and '1'
// Algorithm:
// - Initialize empty string
// - For loop from 0 to numberOfBits:
//   - If index is even, append '1'
//   - Else , append '0'
// - Return string

// function stringy(numberOfBits) {
//   var bits = '';
//
//   for (var i = 0; i < numberOfBits; i ++) {
//     if (i % 2 === 0) {
//       bits += '1';
//     } else {
//       bits += '0';
//     }
//   }
//
//   return bits;
// }

// console.log(stringy(6)); // '101010'
// console.log(stringy(9)); // '101010101'
// console.log(stringy(4)); // '1010'
// console.log(stringy(7)); // '1010101'

// Fibonacci Number Location by Length
//
// Input: numOfDigits (number)
// Output: Fib Number (number)
// Requirements:
// - Given a number, find the first Fibonacci number that contains that number of digits
// - Return the index of that Fibonacci number, not the actual number
//
//
// Algorithm:
// - Initialize index to 0 and loop:
//   - Find length of current Fib numbers string conversion
//   - If the length is equal to the input number of digits, return index
//   - Else, increment the index, and continue looping

// function getFibonacci(index)
//   - Given an index.
//   - If the index < 2, return 1
//   - Else:
//     - return getFibonacci(index - 1) + getFibonacci(index - 2)
//
// getFibonacci:
// - if n < 2, return 1
// - else, do that recursion

// function findFibonacciIndexByLength(numDigits) {
//   var index = 1;
//
//   do {
//     if (String(getFibonacci(index)).length === numDigits) {
//       return index;
//     } else {
//       index += 1;
//     }
//   } while (index < 100);
// }
//
// function getFibonacci(n) {
//   if (n <= 2) { return 1 };
//
//   var first = 1;
//   var second = 1;
//   var index = 2;
//   var fibonacci;
//
//   while (index < n) {
//     fibonacci = first + second;
//     index++;
//     first = second;
//     second = fibonacci;
//   }
//
//   return fibonacci;
// }
//
// console.log(findFibonacciIndexByLength(2));     // 7
// console.log(findFibonacciIndexByLength(10));    // 45
// console.log(findFibonacciIndexByLength(16));    // 74

// Right Triangles
//
// Input: numStars (number)
// Output: triangle of stars (string)
// Requirements:
// - log a right triangle to the console
// - the height and width of the triangle should be the given input
// - the hypotenuse should go from top-left to bottom-right
// Algorithm:
// - For loop from 1 to input:
//   - Log (input - index) spaces and index stars


// function triangle(numStars) {
//   for (var i = 1; i <= numStars; i++) {
//     console.log(' '.repeat(numStars-i) + '*'.repeat(i));
//   }
// }
//
// triangle(5);
// triangle(9);

// Double Doubles
//
// Input: number
// Output: number
// Requirements:
// - If input is a double_number, return input
// - Else, return input * 2
//
// isDoubleNumber:
// - if length is odd, return false
// - else:
//   - convert to string
//   - if input.slice(0, length/2) === input.slice(length/2), return true
//   - else, return false

// function twice(number){
//   if (isDoubleNumber(number)) {
//     return number;
//   } else {
//     return number * 2;
//   }
// }
//
// function isDoubleNumber(num) {
//   numStr = String(num);
//   len = numStr.length;
//
//   if (len % 2 !== 0) {
//     return false;
//   } else {
//     return numStr.slice(0, len/2) === numStr.slice(len/2);
//   }
// }
//
// console.log(twice(37));                 // 74
// console.log(twice(44));                 // 44
// console.log(twice(334433));             // 668866
// console.log(twice(444));                // 888
// console.log(twice(107));                // 214
// console.log(twice(103103));             // 103103
// console.log(twice(3333));               // 3333
// console.log(twice(7676));               // 7676

// Grade book
//
// Input: 3 numbers
// Output: letter grade (string)
// Requirements:
// - if the average between 90 and 100 inclusive, its an A
// - if the average is greater or equal to 80, B
// ...
// - if the average is greater >= 0, F
// - no need to check for values outsidie the bounds of 0 and 100

// function getGrade() {
//   var scores = Array.prototype.slice.call(arguments);
//   var total = scores.reduce(function(sum, score) {
//     return sum + score;
//   });
//
//   var average = total / scores.length;
//
//   if (average >= 90) {
//     return 'A';
//   } else if (average >= 80) {
//     return 'B';
//   } else if (average >= 70) {
//     return 'C';
//   } else if (average >= 60) {
//     return 'D';
//   } else {
//     return 'F';
//   }
// }
//
// console.log(getGrade(95, 90, 93));
// console.log(getGrade(50, 50, 95));

// Clean Up the Words
//
// Input: text (string)
// Output: text (string)
// Requirements:
// - return string with non-letters replaced with spaces
// - if there are multiple non-letters in a row, only replace with one space
//
// Algorithm:
// - replace all non letters with spaces
// - replace all consecutive spaces with one space
//
// - or try to do both in one regex

// function cleanUp(text) {
//   return text.replace(/[^A-Z]+/gi, ' ')
// }
//
// console.log(cleanUp('---1hat\'s my +*& line?'));      // ' what s my line ')

// What Century is That
//
// Input: year (number)
// Output: century (string)
// Requirements:
// - Take year as input and return century
// - The return value is a string that begins with century and ends with suffix
// - Suffix:
//   - th: 4-20, 104-120...
//   - st: 1, 21, 31...
//   - nd: 2, 22, 32...
//   - rd: 3, 23, 33...
//
// Algorithm:
// - Divide the year by 100 and take the ceiling --> century
// - If the last two digits of the century is a number between 4 and 20, 'th'
// - Else If the last digit is 1, 'st'
// - Else if the last digit is 2, 'nd'
// - Else if the last digit is 3, 'rd'
//
// Last two digits:
// - century % 100
// Last digit:
// - century % 10

// function century(year) {
//   var century = Math.ceil(year / 100);
//   var lastDigit = century % 10;
//   var lastTwo = century % 100;
//   var suffix;
//
//   if (lastTwo >= 4 && lastTwo <= 20) {
//     suffix = 'th';
//   } else if (lastDigit === 1) {
//     suffix = 'st';
//   } else if (lastDigit === 2) {
//     suffix = 'nd';
//   } else if (lastDigit === 3) {
//     suffix = 'rd';
//   }
//
//   return String(century) + suffix;
// }
//
// console.log(century(2000));        // '20th'
// console.log(century(2001));        // '21st'
// console.log(century(1965));        // '20th'
// console.log(century(256));         // '3rd'
// console.log(century(5));           // '1st'
// console.log(century(10103));       // '102nd'
// console.log(century(1052));        // '11th'
// console.log(century(1127));        // '12th'
// console.log(century(11201));       // '113th'

// Mistakes:
// - pay more attention to string casting
// - dont try to do method chaining until it works without it
// - step through all test cases when verifying algorithm
