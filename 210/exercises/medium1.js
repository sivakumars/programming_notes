// Rotation Part 1
//
// Input: array
// Output: new array
// Requirements:
// - move the first element of an array to the end
// - do not modify the original array
// - if the input is not an array, return undefined
// - if the input is empty array, return empty array
//
// Algorithm:
// - If the input is not an array, return undefined
// - If the input is empty array, return empty array
// - Initialize a new result array
// - For loop from 1 to length of input array
//   - Push each value to result array
// - Push first value of input array to result array

function rotateArray(array) {
  if (!Array.isArray(array)) {
    return undefined;
  } else if (array.length === 0) {
    return [];
  }

  return array.slice(1).concat(array[0]);
}
//
// console.log(rotateArray([7, 3, 5, 2, 9, 1]));   // [3, 5, 2, 9, 1, 7]
// console.log(rotateArray(['a', 'b', 'c']));      // ['b', 'c', 'a']
// console.log(rotateArray(['a']));                // ['a']
// console.log(rotateArray([1, 'a', 3, 'c']));;   // [ 'a', 3, 'c', 1 ]
// console.log(rotateArray([{a: 2}, [1, 2], 3])); // [ [1, 2], 3, {a: 2} ]
// console.log(rotateArray([]));                   // []
//
// // return undefined if the argument is not an array
// console.log(rotateArray());                   // undefined
// console.log(rotateArray(1));                  // undefined
// the input array is not mutated
// x = [1, 2, 3, 4]
// console.log(rotateArray(x));                  // [2, 3, 4, 1]
// console.log(x)                  // [1, 2, 3, 4]

// Rotation Part 2
//
// Input: number (number), # of digits (number)
// Output: number
// Requirements:
// - rotate last n digits of a number
// - shift n digits to the left and move leftmost digit to the right-end
//
// Algorithm:
// - Convert number to string
// - Split string into array of chars
// - Convert array of chars --> array of digits (MAP)
// - RotateArray Function: Pass in digits to be rotated by slicing array based on # of digits
// - take slice of unrotated digits concatenated with result of rotated digits function
// - Convert array of digits --> array of chars
// - Join into string
// - Convert back to number and return
//
// - Function RotateArray of Digits:
//   - Use function from previous exercise

function rotateRightmostDigits(number, n) {
  var unrotatedArray = String(number).split('').map(Number);
  var toRotate = unrotatedArray.slice(unrotatedArray.length - n);
  var noRotate = unrotatedArray.slice(0, unrotatedArray.length - n);

  var rotatedArray = noRotate.concat(rotateArray(toRotate));

  return Number(rotatedArray.map(String).join(''));
}
//
// console.log(rotateRightmostDigits(735291, 1)); // 735291
// console.log(rotateRightmostDigits(735291, 2)); // 735219
// console.log(rotateRightmostDigits(735291, 3)); // 735912
// console.log(rotateRightmostDigits(735291, 4)); // 732915
// console.log(rotateRightmostDigits(735291, 5)); // 752913
// console.log(rotateRightmostDigits(735291, 6)); // 352917

// Rotation Part 3
//
// Input: number
// Output: number
// Requirements:
// - Perform maximum rotation of a number, which means:
//   - Run rotateRightmostDigits(number, 5)
//   - Run rotateRightmostDigits(number, 4)
//   - ...
//   - Run rotateRightmostDigits(number, 2)

// function maxRotation(number) {
//   numLength = String(number).length;
//
//   for (var i = numLength; i > 1; i--) {
//     number = rotateRightmostDigits(number, i);
//   }
//
//   return number;
// }
//
// console.log(maxRotation(735291));        // 321579
// console.log(maxRotation(3));             // 3
// console.log(maxRotation(35));            // 53
// console.log(maxRotation(105));           // 15 # the leading zero gets dropped
// console.log(maxRotation(8703529146));    // 7321609845

// Stack Machine Interpretation
//
// Input: text containing instructions and numbers (string)
// Output: depends on instructions (e.g. PRINT)
// Requirements:
// - implement a stack and register language
//   - stack --> last in, first out; like an array using push and pop
//   - register --> separate variable
// - run instructions in order from left to right of string
// - stack and register are initially both empty
//   - stack --> []
//   - register --> 0
// - Possible inputs in the string:
//   - number --> set register to that value
//   - PUSH, ADD, SUB, MULT, DIV, MOD, POP (corresponding operation)
//   - PRINT --> log the current register value
// - assume that all instructions dont contain errors or invalid inputs
//
// Algorithm:
// - Initialize stack to empty array and register to 0
// - Split input on spaces into array of strings
// - For each string in array:
//   - If its a number: convert to number and assign to register
//   - Else if "PUSH": push current register value to stack (leave in register too)
//   - Else if "ADD": Pop value from stack and add it to the current register value
//   - Else if "SUB": Pop from stack and substract from register
//   - Else if "MULT": Pop and multiply
//   - "DIV": Pop and divide
//     - Take Math.floor of result
//   - "MOD": Pop and store remainder in register
//   - "POP": Pop and place popped value in register
//   - "PRINT": Print the current register value


// function minilang(program) {
//   var stack = [];
//   var register = 0;
//
//   program.split(' ').forEach(function(instruction) {
//     if (Number(instruction)) {
//       register = Number(instruction);
//     } else if (instruction === 'PUSH') {
//       stack.push(register);
//     } else if (instruction === 'ADD') {
//       register += stack.pop();
//     } else if (instruction === 'SUB') {
//       register -= stack.pop();
//     } else if (instruction === 'MULT') {
//       register *= stack.pop();
//     } else if (instruction === 'DIV') {
//       register = Math.floor(register / stack.pop());
//     } else if (instruction === 'MOD') {
//       register %= stack.pop();
//     } else if (instruction === 'POP') {
//       register = stack.pop();
//     } else if (instruction === 'PRINT') {
//       console.log(register);
//     }
//   });
// }
//
// console.log(minilang('PRINT'));
// // 0
//
// console.log(minilang('5 PUSH 3 MULT PRINT'));
// // 15
//
// console.log(minilang('5 PRINT PUSH 3 PRINT ADD PRINT'));
// // 5
// // 3
// // 8
//
// console.log(minilang('5 PUSH POP PRINT'));
// // 5
//
// console.log(minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT'));
// // 5
// // 10
// // 4
// // 7
//
// console.log(minilang('3 PUSH PUSH 7 DIV MULT PRINT '));
// // 6
//
// console.log(minilang('4 PUSH PUSH 7 MOD MULT PRINT '));
// // 12
//
// console.log(minilang('-3 PUSH 5 SUB PRINT'));
// // 8
//
// console.log(minilang('6 PUSH'));
// // (nothing printed; no PRINT commands)

// Word to Digit
//
// Input: text (string)
// Output: text (string)
// Requirements:
// - return a new string
// - ouput should replace numbers (written as words) to their number counterparts
//
// Algorithm:
// - Create NUM_DICT constant array ['zero', 'one', ... , 'nine']
// - Split text on spaces into array of words
// - For each word:
      // - extract letters only and check
//   - if the word exists in NUM_DICT --> set index = NUM_DICT.indexOf(word); if index >= 0, then:
//     - map word to index
//   - else:
//     - map it to same word
// - Return mapped array joined on spaces

// Options:
// - Match word on letters and check for that onl

// Algorithm 2:
// - For each word in NUM_DICT:
//   - Create regex with that word
//   - Replace all regex matches in text

// function wordToDigit(text) {
//   NUM_DICT = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
//
//   NUM_DICT.forEach(function(numWord, index) {
//     var regex = new RegExp(numWord, 'g');
//     text = text.replace(regex, String(index));
//   });
//
//   return text;
// }
//
// console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// //'Please call me at 5 5 5 1 2 3 4. Thanks.'
//
// Fibonacci Numbers (Recursion)
//
// Input: n (number)
// Output: number
// Requirements:
// - return the nth fibonacci number, given n
//   - fibonacci is the sum of the previous two numbers
// - the first two fibonacci numbers are 1 and 1, the third is 1 + 1 = 2
//
// Algorithm:
// - if n === 1 or n === 2, return 1
// - else:
//   - return fib(n-1) + fib(n-2)

// function fibonacci(n) {
//   if (n <= 2) {
//     return 1;
//   } else {
//     return fibonacci(n - 1) + fibonacci(n - 2);
//   }
// }
//
// console.log(fibonacci(1));   // 1
// console.log(fibonacci(2));   // 1
// console.log(fibonacci(3));   // 2
// console.log(fibonacci(4));   // 3
// console.log(fibonacci(5));   // 5
// console.log(fibonacci(12));  // 144
// console.log(fibonacci(20));  // 6765

// Fibonacci Numbers (Procedural)

// Input: n (number)
// Output: number
// Requirements:
// - return the nth fibonacci number, given n
//   - fibonacci is the sum of the previous two numbers
// - the first two fibonacci numbers are 1 and 1, the third is 1 + 1 = 2

// Algorithm:
// - Set firstNum to 1
// - Set secondNum to 1
// - Set index = 3
// - Initialize result variable
// - Loop while index is less than or equal n (input)
//   - Add firstNum and secondNum and assign to result
//   - set secondNum to result and firstNum to secondNum
//   - Increment index
// - Return result
//
// first = 1, second = 1, index = 3, n = 5
// result = 2 --> second = 2, first = 1, index = 4, n = 5
// result = 3, second = 3, first = 2, index = 5, n = 5

// function fibonacci(n) {
//   var first = 1;
//   var second = 1;
//   var index = 3;
//   var result;
//
//   if (n <=2) {
//     return 1;
//   }
//
//   while (index <= n) {
//     result = first + second;
//     first = second;
//     second = result;
//     index++;
//   }
//
//   return result;
// }
//
// console.log(fibonacci(4));    // 5
// console.log(fibonacci(20));   // 6765
// console.log(fibonacci(50));   // 12586269025
// console.log(fibonacci(100));  // 354224848179261915075

// Fibonacci Numbers (Memoization)
//
// Requirements:
// - use memoization to store computed answers in a JS object
//
//
//
// Algorithm:
// - Look up n in lookup table as key
//   - If corresponding value exists (is not undefined), return it
//   - Else: return fibonacci(n - 1) + fibonacci(n - 2)

function fibonacci(n) {
  var result;

  var lookup = {
    1: 1,
    2: 1,
  };

  if (lookup[n]) {
    return lookup[n]
  } else {
    lookup[n]= fibonacci(n - 1) + fibonacci(n - 2)
    return lookup[n]
  }
}

console.log(fibonacci(1));   // 1
console.log(fibonacci(2));   // 1
console.log(fibonacci(3));   // 2
console.log(fibonacci(4));   // 3
console.log(fibonacci(5));   // 5
console.log(fibonacci(12));  // 144
console.log(fibonacci(20));  // 6765
