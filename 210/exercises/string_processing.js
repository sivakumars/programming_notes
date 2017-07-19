// Uppercase Check
//
// Input: string
// Output: boolean
// Requirements:
// - if all alphabetic chars are uppercase, return true
// - else, return false
// - Ignore non-alpha characters
//
// Algorithm:
// - Replace all non-alpha chars with blanks
// - For loop from 0 to replacedString.length
//   - if char.toUpperCase !== char, return false
// - If loop finishes, return true

// function isUppercase(string) {
//   var replaced = string.replace(/[^a-z]/ig, '');
//
//   for (var i = 0; i < replaced.length; i++) {
//     if (replaced[i] !== replaced[i].toUpperCase()) {
//       return false;
//     }
//   }
//
//   return true;
// }
//
// console.log(isUppercase('t'));          // false
// console.log(isUppercase('T'));          // true
// console.log(isUppercase('Four Score')); // false
// console.log(isUppercase('FOUR SCORE')); // true
// console.log(isUppercase('4SCORE!'));    // true
// console.log(isUppercase(''));           // true
//
// Delete Vowels
//
// Input: array of strings
// Output: array of strings
// Requirements:
// - Remove vowels from every string in the array
//
// Algorithm:
// - for each string in the array:
//   - map the string to a string without vowels
//     - use regex to replace vowels
// - return mapped array

// function removeVowels(strings) {
//   return strings.map(function(string) {
//     return string.replace(/[aeiou]/ig, '');
//   });
// }
//
// console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));             // ['bcdfghjklmnpqrstvwxyz']
// console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));      // ['grn', 'YLLW', 'blck', 'wht']
// console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                    // ['BC', '', 'XYZ']

// Lettercase Counter
//
// Input: string
// Output: object with 3 properties
// Requirements:
// - write a function that takes a string
// - returns an object with 3 properties
//    - lowercase
//    - uppercase
//    - neither
//
// Algorithm:
// - Initialize a result object
// - assign values to properties
//   - assign uppercase and lowercase variables to make neither calculation simpler
//   - uppercase: use regex to find matches for uppercase letters and find length of matchs return value
//   - lowercase: same except use lowercase letter regex
//   - neither: subtract uppercase and lowercase from length of string
// - return object

// function letterCaseCount(string) {
//   var uppercase = string.match(/[A-Z]/g) || [];
//   var lowercase = string.match(/[a-z]/g) || [];
//
//   return {
//     lowercase: lowercase.length,
//     uppercase: uppercase.length,
//     neither: string.length - uppercase.length - lowercase.length,
//   }
// }
//
//
// console.log(letterCaseCount('abCdef 123')); // { lowercase: 5, uppercase: 1, neither: 4 }
// console.log(letterCaseCount('AbCd +Ef'));   // { lowercase: 3, uppercase: 3, neither: 2 }
// console.log(letterCaseCount('123'));        // { lowercase: 0, uppercase: 0, neither: 3 }
// console.log(letterCaseCount(''));           // { lowercase: 0, uppercase: 0, neither: 0 }

// Capitalize Words
//
// Input: string
// Output: string
// Requirements:
// - return a new string
// - with every word having its first char capitalized and everything else lowercase
// - assume that a word is a sequence of nonblank characters
//
// Algorithm:
// - Split the text into an array of words (strings)
// - For each string in the array
//   - Map the string to a capitalized string
//     - Slice the first character and apply toUpperCase
//     - APpend the remaining characters and apply toLowerCase
// - Return the mapped array joined

// function wordCap(text) {
//   var capitalizedWords = text.split(' ').map(function(word) {
//     return word.slice(0, 1).toUpperCase() + word.slice(1).toLowerCase();
//   });
//
//   return capitalizedWords.join(' ');
// }
//
// console.log(wordCap('four score and seven'));    // 'Four Score And Seven'
// console.log(wordCap('the javaScript language')); // 'The Javascript Language'
// console.log(wordCap('this is a "quoted" word')); // 'This Is A "quoted" Word'

// Swap Case
//
// Input: string
// Output: string
// Requirements:
// - Swap all lowercase letters with their uppercase equivalent
// - Leave non-alpha characters alone
//
// Algorithm:
// - Split string into array of chars
// - For each char in array, map:
//   - If it matches regex uppercase, apply lowercase and return char
//   - If it matches regex lowercase, apply uppercase and return char
//   - Else, return char
// - Join and return

// function swapcase(string) {
//   var swappedChars = string.split('').map(function(char) {
//     if (char.match(/[A-Z]/)) {
//       return char.toLowerCase();
//     } else if (char.match(/[a-z]/)) {
//       return char.toUpperCase();
//     } else {
//       return char;
//     }
//   });
//
//   return swappedChars.join('');
// }
//
// console.log(swapcase('CamelCase'));         // 'cAMELcASE'
// console.log(swapcase('Tonight on XYZ-TV')); // 'tONIGHT ON xyz-tv'

// Staggered Caps Part 1
//
// Input: string
// Output: string
// Requirements:
// - Alternate capialization of each char in a string
// - Start with a capital letter for the first char
// - Non-alpha chars should count in the alternation
//
// Algorithm:
// - Split string into array of chars
// - For each char, map to:
//   - if index is even, toUpperCase
//   - else, tolowerCase
// - return array joined into string

// function staggeredCase(string) {
//   var alternatedArray = string.split('').map(function(char, index) {
//     if (index % 2 === 0) {
//       return char.toUpperCase();
//     } else {
//       return char.toLowerCase();
//     }
//   });
//
//   return alternatedArray.join('');
// }

// console.log(staggeredCase('I Love Launch School!'));     // 'I LoVe lAuNcH ScHoOl!'
// console.log(staggeredCase('ALL_CAPS'));                  // 'AlL_CaPs'
// console.log(staggeredCase('ignore 77 the 444 numbers')); // 'IgNoRe 77 ThE 444 NuMbErS'

// Staggered Caps Part 2
//
// Input: string
// Output: string
// Requirements:
// - this time, ignore non-alpha characters in the alternating count
//
// Algorithm:
// - Split string into array of chars
// - Set toUpper variable to true.
// - For each char in array, map to:
//   - If its not a letter, return char
//   - else if toUpper is true, switch toUpper, return uppercase
//   - else, switchtoUpper, return lowercase
// - Join and return string

// function staggeredCase(string) {
//   var toUpper = true;
//
//   var staggered = string.split('').map(function(char){
//     if (char.match(/[^a-z]/ig)) {
//       return char;
//     } else if (toUpper) {
//       toUpper = !toUpper;
//       return char.toUpperCase();
//     } else {
//       toUpper = !toUpper;
//       return char.toLowerCase();
//     }
//   });
//
//   return staggered.join('');
// }
//
// console.log(staggeredCase('I Love Launch School!'));     // 'I lOvE lAuNcH sChOoL!'
// console.log(staggeredCase('ALL CAPS'));                  // 'AlL cApS'
// console.log(staggeredCase('ignore 77 the 444 numbers')); // 'IgNoRe 77 ThE 444 nUmBeRs'

// How long are you
//
// Input: string
// Output: array of strings
// Requirements:
// - write a function
// - return array with every word and its length appended to it with a blank space separator
// - assume that words are separated by a space in the input string
//
// Algorithm:
// - Split string into an array of strings
// - For each word in array, map to:
//   - return string + string.length
// - Return mapped array

// function wordLengths(words) {
//   if (!words) {
//     return [];
//   }
//
//   return words.split(' ').map(function(word) {
//     return word + ' ' + String(word.length);
//   });
// }
//
// console.log(wordLengths('cow sheep chicken'));
// // result
// ['cow 3', 'sheep 5', 'chicken 7']
//
// console.log(wordLengths('baseball hot dogs and apple pie'));
// // result
// ['baseball 8', 'hot 3', 'dogs 4', 'and 3', 'apple 5', 'pie 3']
//
// console.log(wordLengths('It ain\'t easy, is it?'));
// // result
// ['It 2', 'ain\'t 5', 'easy, 5', 'is 2', 'it? 3']
//
// console.log(wordLengths('Supercalifragilisticexpialidocious'));
// // result
// ['Supercalifragilisticexpialidocious 34']
//
// console.log(wordLengths(''));
// // result
// []

// Search Word Part 1
//
// Input: searchQuery (string), text (string)
// Output: number
// Requirements:
// - Taking text and a searchQuery, return the number of times the searchQuery appears in the text
// - Assume both arguments will always be provided as arguments
//
// Algorithm:
// - Split text into array of strings
// - For each word in array, filter if:
//   - word === searchQuery
// - return the count of the filtered array

// function searchWord(searchQuery, text) {
//   return text.split(' ').filter(function(word) {
//     return word.toLowerCase() === searchQuery.toLowerCase();
//   }).length;
// }

// function searchWord(word, text) {
//   var regex = new RegExp('\\b' + word + '\\b', 'gi');
//   var matches = text.match(regex);
//   return matches ? matches.length : 0;
// }
//
// var text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'
//
// console.log(searchWord('sed', text));;   // 3
// console.log(searchWord('qui', text));   // should only return 4, NOT 13

// Search Word Part 2
//
// Input: text (string), searchQuery (string)
// Output: text (string)
// Requirements:
// - return text with all occurences of searchQuery "highlighted"
// - "highlighted" means **UPPERCASEDWORD**
// Algorithm:
// - Split text into array of words
// - For each word in array, map to:
//   - if searchQuery.lowercase === word.lowercase, return highlighted word
//   - else, return word
// - Return and join array

// function searchWord(searchQuery, text) {
//   var highlights = text.split(' ').map(function(word){
//     if (searchQuery.toLowerCase() === word.toLowerCase()) {
//       return '**' + word.toUpperCase() + '**';
//     } else {
//       return word;
//     }
//   });
//
//   return highlights.join(' ');
// }
//
// var text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'
//
// console.log(searchWord('sed', text));
