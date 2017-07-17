// How Old is Teddy
//
// Input: nothing
// Output: log a number to console
// Requirements:
// - generate a random number between 20 and 200 inclusive
// var max = 200;
// var min = 20;
//
// var rand = Math.random();
//
//
//
// var age = (Math.random() * (max - min + 1).toFixed();
//
// console.log('Teddy is ' + age + ' years old!');

// Searching 101
//
// Input: 6 numbers from the user
// Output: boolean in the form of a log statement
// Requirements:
// - Return true if the 6th number is among the first 5
// - else, return false
//
// Algorithm:
// - Initialize an array of prompts (for first 5 numbers) ['1st', '2nd'...]
// - Initialize an array of inputs
// - For each value in array:
//   - prompt user for input using prompts array
//   - push user input to inputs array
// - Prompt user for last number and assign to variable
// - If inputs includes last, return true message
// - Otherwise, return false message

// var prompts = ['1st', '2nd', '3rd', '4th', '5th'];
// var inputs = [];
// var input;
// var last;
//
// for (var i = 0; i < prompts.length; i++) {
//   input = prompt('Enter the ' + prompts[i] + ' number: ');
//   inputs.push(input);
// }
//
// last = prompt('Enter the last number: ');
//
// if (inputs.includes(last)) {
//   message = 'The number ' + last + ' appears in ' + String(inputs);
// } else {
//   message = 'The number ' + last + ' does not appear in ' + String(inputs);
// }
//
// console.log(message);

// Palindromic Strings Part 1
//
// Input: string
// Output: boolean
// Requirements:
// - return true if the string has the same characters forward and in reverse
// - case matters
//
// Algorithm:
// - Split input into array of chars
// - Reverse array of chars
// - Join array of chars
// - Check if joined string is equal to original input string

// Algorithm (w/o array methods):
// - Assign leftIndex to 0
// - Assign right Index to length - 1
// - For loop from 0 to length / 2
//   - if string[leftIndex] !== string[rightIndex], return false
//   - else keep checking
// - If loop finishes, return true

// function isPalindrome(input) {
//   var reversed = input.split('').reverse().join('');
//   return input === reversed;
// }

// function isPalindrome(input) {
//   var leftIndex = 0;
//   var rightIndex = input.length - 1;
//
//   for (var i = 0; i < input.length / 2; i++) {
//     if (input[leftIndex + i] !== input[rightIndex - i]) {
//       return false;
//     }
//   }
//   return true;
// }
//
// console.log(isPalindrome('madam'));                    // true
// console.log(isPalindrome('Madam'));                    // false (case matters)
// console.log(isPalindrome('madam i\'m adam'));          // false (all characters matter)
// console.log(isPalindrome('356653'));                   // true

// function isRealPalindrome(input) {
//   input = input.toLowerCase().replace(/[^a-z0-9]/g, '');
//   var leftIndex = 0;
//   var rightIndex = input.length - 1;
//
//   for (var i = 0; i < input.length / 2; i++) {
//     if (input[leftIndex + i] !== input[rightIndex - i]) {
//       return false;
//     }
//   }
//   return true;
// }
// //
// console.log(isRealPalindrome('madam'));               // true
// console.log(isRealPalindrome('Madam'));               // true (case does not matter)
// console.log(isRealPalindrome('Madam, I\'m Adam'));    // true (only alphanumerics matter)
// console.log(isRealPalindrome('356653'));              // true
// console.log(isRealPalindrome('356a653'));             // true
// console.log(isRealPalindrome('123ab321'));            // false

// Palindromic Number
//
// Input: number
// Output: boolean
// Requirements:
// - if integer is palindromic, return true
// - otherwise, return false
// - palindromic number reads the same forwards and backwards
//
// Algorithm:
// - Convert number to string
// - Split string into array of chars
// - Set leftIndex to 0
// - Set rightIndex to length - 1
// - Loop from 0 to length/2 (or while leftIndex < rightIndex)
//   - If the character at the leftindex !== rightIndex, return false
//   - Increment leftIndex and decrement rightIndex each time
// - If loop finishes, return true

// function isPalindromicNumber(number) {
//   var str = String(number);
//   var leftIndex = 0;
//   var rightIndex = str.length - 1;
//
//   while (leftIndex < rightIndex) {
//     if (str[leftIndex] !== str[rightIndex]) {
//       return false;
//     }
//     leftIndex++;
//     rightIndex--;
//   }
//
//   return true;
// }
//
// console.log(isPalindromicNumber(34543));        // true
// console.log(isPalindromicNumber(123210));       // false
// console.log(isPalindromicNumber(22));           // true
// console.log(isPalindromicNumber(5));            // true

// Running Totals
//
// Input: array of numbers
// Output: array of numbers
// Requirements:
// - FOr the output array, each element is the element at that same index + the sum of any previous elements
// - Its also could be worded: each element is the sum of the element at the same index in the input array + the previous element of the output array
// Algorithm:
// - Set initial_sum to 0
// - Initialize an output array
// - For loop on input array from 0 to lenght of input array
//   - Assign output array element = initial_sum + element value at same index of input array
//   - Reassign initial_sum to the value just assigned to ouput array
// - Return output array

// function runningTotal(array) {
//   var resultArray = [];
//   var sum = 0;
//
//   // for (var i = 0; i < array.length; i++) {
//   //   resultArray[i] = sum + array[i];
//   //   sum = resultArray[i];
//   // }
//
//   // array.forEach(function(element, index) {
//   //   resultArray[index] = sum + element;
//   //   sum = resultArray[index];
//   // });
//
//   // var resultArray = array.map(function(element) {
//   //   var outputValue = sum + element;
//   //   return sum = outputValue;
//   // });
//
//   array.reduce(function(all, element, index) {
//     return resultArray[index] = all + element;
//   }, 0);
//
//   return resultArray;
// }
//
// console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
// console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
// console.log(runningTotal([3]));                    // [3]
// console.log(runningTotal([]));                     // []

// Letter Swap
//
// Input: text (string)
// Output: text (string)
// Requirements:
// - Swap the first and last characters of each word
// - Assume every word contains at least one letter
// - The input will not be empty
// - The input will not contain any leading, trailing, or repeating spaces
// Algorithm:
// - Split the string on spaces --> array of words
// - forEach string in the array:
//   - Split string into array of characters
//   - Set first = array[0];
//   - Set last = array[array.length -1]
//   - Set array[0] = last;
//   - Set array[array.length - 1] = first;
//   - Join array on ''
// - Join outer array on spaces

// function swap(text) {
//   var words = text.split(' ').map(function(word, index) {
//     // var chars = word.split('');
//     //
//     // var first = chars[0];
//     // var last = chars[chars.length - 1];
//     //
//     // chars[0] = last;
//     // chars[chars.length -1] = first;
//     //
//     // return chars.join('');
//
//     return word[word.length - 1] + word.slice(1, -1) + word[0];
//   });
//
//   return words.join(' ');
// }
//
// console.log(swap('Oh what a wonderful day it is'));    // 'hO thaw a londerfuw yad ti si'
// console.log(swap('Abcde'));                            // 'ebcdA'
// console.log(swap('a'));                                // 'a'

// Letter Counter Part 1
//
// Input: text (string)
// Output: object (keys: numbers, values: numbers)
// Requirements:
// - Return object that contains keys as word sizes and values as number of words of that corresponding size
// - Words are seaprated by spaces and can contain any character
//
// Algorithm:
// - Initialize empty results object
// - Split text (on spaces) into an array of words
// - For each word in the array
//   - Check the length of the word
//   - If the value of results[String(length)] is undefined, set it to 1
//   - Else, Increment results[String(length)] by 1

// function wordSizes(text) {
//   results = {};
//
//   text.split(' ').forEach(function(word) {
//     var length = word.length;
//
//     if (!results[length]) {
//       results[length] = 0;
//     }
//
//     results[length]++;
//   });
//
//   return results;
// }
//
// console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4" : "1", "5": 1, "6": 1 }
// console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
// console.log(wordSizes('What\'s up doc?'));                             // { "6": 1, "2": 1, "4": 1 }
// console.log(wordSizes(''));                                            // {}

// Letter Counter Part 2

// function wordSizes(text) {
//   var results = {};
//   var words = text.split(' ');
//
//   for (var i = 0; i < words.length; i++) {
//     var length = words[i].replace(/[^a-z]/ig, '').length;
//
//     if (!length) {
//       continue;
//     }
//
//     if (!results[length]) {
//       results[length] = 0;
//     }
//
//     results[length]++;
//   }
//
//   return results;
// }
//
// console.log(wordSizes('Four score and seven.'));                        // { "3": 1, "4": 1, "5": 2 }
// console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));   // { "3": 5, "6": 3 }
// console.log(wordSizes('What\'s up doc?'));                              // { "5": 1, "2": 1, "3": 1 }
// console.log(wordSizes(''));                                             // {}
