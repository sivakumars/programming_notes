// Alphabetic Numbers
//
// Input: array of integers
// Output: sorted array of integers
// Requirements:
// - sort based on english word for each number
// Abstractions:
// - Array of unsorted numbers --> Array of sorted numbers
// Algorithm:
// - create constant with all number words
// - Use sort:
//   - if toEnglish(num1) < toEnglish(num2), return -1
//   - else if >, return 1
//   - else, return 0

// NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
//
// function alphabeticNumberSort(unsortedNumbers) {
//   NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
//
//   return unsortedNumbers.sort(function(num1, num2) {
//     if (NUMBER_WORDS[num1] < NUMBER_WORDS[num2]) {
//       return -1;
//     } else if (NUMBER_WORDS[num1] > NUMBER_WORDS[num2]) {
//       return 1;
//     }
//   });
// }
//
// console.log(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// // [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0])

// Sum of Digits
//
// Input: number
// Output: number
// Requirements:
// - write a method with one argument
// - input is positive integer
// - return sum of its digits
// - use list processing techniques
// Algorithm:
// - Convert number to string
// - Split string on '' --> array of string chars
// - MAP: array of string chars --> array of number digits
// - REDUCE: array of number digits --> sum of digits

// function sum(number) {
//   return String(number).split('').reduce(function(sum, item) {
//     return sum + parseInt(item, 10);
//   }, 0);
// }
//
// console.log(sum(23));          // 5
// console.log(sum(496));         // 19
// console.log(sum(123456789));   // 45

// Multiply All Pairs
//
// Input: two arrays
// Output: one array
// Requirements:
// - write a function with 2 array arguments
// - each input array will consist of numbers
// - return an array with all the combinatinos of products between elements of the two arrays
// - sort the results by increasing value
// - assume neither arrray is empty
// - duplicates are okay
//
// Algorithm:
// - Initialize result array
// - For loop through 1st array (i)
//   - For loop through 2nd array (j)
//     - push product of array1[i] * array2[j] to result array
// - Return result array

// function multiplyAllPairs(arr1, arr2) {
//   var result = [];
//
//   arr1.forEach(function(num1) {
//     arr2.forEach(function(num2) {
//       result.push(num1 * num2);
//     });
//   });
//
//   return result.sort(function(num1, num2) {
//     if (num1 < num2) {
//       return -1;
//     } else if (num1 > num2) {
//       return 1;
//     }
//   });
// }
//
// console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2])); // [2, 4, 4, 6, 8, 8, 12, 16]

// Sum of Sums
//
// Input: array of numbers
// Output: number
// Requirements:
// - takes array of numbers
// - returns sum of the sums of each leading subsequence
// - assume array contains at least 1 number
//
// Algorithm:
// - Initialize subsequences array
// - array of numbers --> array of subsequences
// - For each element in the input array:
//   - Iterate from 0 to (elements index + 1)
//     - push the values into the subsequences array
// - Reduce the subsequences array to a sum and return the value

// function sumOfSums(numbers) {
//   var subsequences = [];
//
//   numbers.forEach(function(number, index) {
//     for (var i = 0; i <= index; i++) {
//       subsequences.push(numbers[i]);
//     }
//   });
//
//   return subsequences.reduce(function(sum, item) {
//     return sum + item;
//   });
// }
//
// console.log(sumOfSums([3, 5, 2]));       // (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
// console.log(sumOfSums([1, 5, 7, 3]));    // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
// console.log(sumOfSums([4]));             // 4
// console.log(sumOfSums([1, 2, 3, 4, 5])); // 35

// Leading Substrings
//
// Input: string
// Output: array of strings
// Requirements:
// - write a function
// - given a string, return all substrings that start with the first character of the input string
// - sort the substrings from shrotest to longest
// Algorithm:
// - Initialize array of substrings
// - For each char in string:
//   - Extract substring from 0 to current chars index and push to array
// - Return array

// function substringsAtStart(string) {
//   return string.split('').map(function(_, index) {
//     return string.slice(0, index + 1);
//   });
// }
//
// console.log(substringsAtStart('abc'));   // ['a', 'ab', 'abc']
// console.log(substringsAtStart('a'));     // ['a']
// console.log(substringsAtStart('xyzzy')); // ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

// All Substrings
//
// Input: string
// Output: array of strings
// Requirements:
// - write a function
// - return all substrings of the input string
// - order the array by where in the string the substring begins
//   - all substrings that start at index 0 of the input string come first
//   - next, sort the substrings by length from shortest to longest
// - use substringsAtStart function from previous exercise
//
// Algorithm:
// - Initialize result array
// - Split string into array of chars
// - For each char:
//   - Push substringsAtStart(char) into result array
// - Return result array; should be sorted properly already

// function substrings(string) {
//   var result = [];
//
//   string.split('').forEach(function(char, index) {
//     result = result.concat(substringsAtStart(string.slice(index)));
//   });
//
//   return result;
// }
//
//
// console.log(substrings('abcde'));
// // result
// [ 'a', 'ab', 'abc', 'abcd', 'abcde',
//   'b', 'bc', 'bcd', 'bcde',
//   'c', 'cd', 'cde',
//   'd', 'de',
//   'e' ]

// Palindromic Substrings
//
// Input: string
// Output: string
// Requirements:
// - write a function
// - returns substrings that are palindromic
// - arrange substrings in the same sequence as they appear in the string
// - include duplicates
// - use subtrings function frmo previous exercise
// - for palindromes, all characters matter and case matters
//   - but single characters are not palindromes
//
// Algorithm:
// - All subtrings of a string --> Palindromic substrings of a string (FILTER)
// - Call substrings function
// - Filter substrings:
//   - return isPalindrome(string);
//
// isPalindrome function:
// - if length of string is less than 2, return false
// - split string into chars
// - reverse string
// - join string
// - if result === original string, return true
// - otherwise, return false

// function palindromes(string) {
//   return substrings(string).filter(function(substring) {
//     return isPalindrome(substring);
//   })
// }
//
// function isPalindrome(string) {
//   var reversed = string.split('').reverse().join('');
//   return (string.length >= 2) && (string === reversed);
// }
//
// console.log(palindromes('abcd'));  // []
// console.log(palindromes('madam')); // ['madam', 'ada']
// console.log(palindromes('hello-madam-did-madam-goodbye'));
// // result
// [ 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
//   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
//   '-madam-', 'madam', 'ada', 'oo' ]
//
// console.log(palindromes('knitting cassettes'));
// // result
// [ 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt' ]

// Grocery List
//
// Input: array of arrays
// Output: array
// Requirements:
// - given a nested array with an item and a count, return an array with the proper number of items corresponding to its count
//
// Algorithm:
// - Array of arrays with fruit and count --> Array of fruits (REDUCE)
// - forEach item in array:
//   - push item into result array count number of times
// - return result array

// function buyFruit(fruitCounts) {
//   var result = [];
//
//   fruitCounts.forEach(function(fruitCount) {
//     for (var i = 0; i < fruitCount[1]; i++) {
//       result.push(fruitCount[0]);
//     }
//   });
//
//   return result;
// }
//
// function buyFruit(fruitCounts) {
//   var nestedFruits = fruitCounts.map(function(fruit) {
//     var result = [];
//
//     for (var i = 0; i < fruit[1]; i++) {
//       result.push(fruit[0]);
//     }
//
//     return result;
//   });
//
//   return nestedFruits.reduce(function(result, item) {
//     return result.concat(item);
//   });
// }
//
//
// console.log(buyFruit([['apples', 3], ['orange', 1], ['bananas', 2]]));
// // result
// ['apples', 'apples', 'apples', 'orange', 'bananas','bananas']

// Inventory Item Transactions
//
// Input: number and array of objects
// Output: array of objects
// Requirements:
// - Given an array of objects, return an array containing only the objects where the objects id property matches the input number
//
// Abstractions:
// - array of objects --> array of objects where object[id] === input number (FILTER)
//
// Algorithm:
// - Filter the array of objects
//   - return if objects property === input number

function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(function(transaction) {
    return transaction.id === inventoryItem;
  });
}

// var transactions = [ {id: 101, movement: 'in', quantity: 5, },
//                      {id: 105, movement: 'in', quantity: 10, },
//                      {id: 102, movement: 'out', quantity: 17, },
//                      {id: 101, movement: 'in', quantity: 12, },
//                      {id: 103, movement: 'out', quantity: 15, },
//                      {id: 102, movement: 'out', quantity: 15, },
//                      {id: 105, movement: 'in', quantity: 25, },
//                      {id: 101, movement: 'out', quantity: 18, },
//                      {id: 102, movement: 'in', quantity: 22, },
//                      {id: 103, movement: 'out', quantity: 15, },];
//
// console.log(transactionsFor(101, transactions));
// // result
// [ { id: 101, movement: 'in', quantity: 5 },
//   { id: 101, movement: 'in', quantity: 12 },
//   { id: 101, movement: 'out', quantity: 18 }, ]

// Inventory Item Availability
//
// Input: number and array of objects
// Output: boolean
// Requirements:
// - return whether the item is available, meaning its total quantity is positive
//
// Abstractions:
// - Array of transactions --> boolean (REDUCE)

// Algorithm:
// - For each item in transactions, reduce to total
//   - If movement is 'in', add quantity
//   - if movement is 'out', subtract from quantity
// - return (total > 0) boolean

// function isItemAvailable(inventoryItem, transactions) {
//   var filteredTransactions = transactionsFor(inventoryItem, transactions);
//
//   var total = filteredTransactions.reduce(function(result, item) {
//     if (item.movement === 'in') {
//       return result + item.quantity;
//     } else if (item.movement === 'out') {
//       return result - item.quantity;
//     }
//   }, 0);
//
//   return (total > 0);
// }
//
// var transactions = [ {id: 101, movement: 'in', quantity: 5, },
//                      {id: 105, movement: 'in', quantity: 10, },
//                      {id: 102, movement: 'out', quantity: 17, },
//                      {id: 101, movement: 'in', quantity: 12, },
//                      {id: 103, movement: 'out', quantity: 15, },
//                      {id: 102, movement: 'out', quantity: 15, },
//                      {id: 105, movement: 'in', quantity: 25, },
//                      {id: 101, movement: 'out', quantity: 18, },
//                      {id: 102, movement: 'in', quantity: 22, },
//                      {id: 103, movement: 'out', quantity: 15, },];
//
// console.log(isItemAvailable(101, transactions)); // false
// console.log(isItemAvailable(105, transactions)); // true
