// Lettercase Percentage Ratio
//
// Input: text (string)
// Output: object (3 properties -- lowercase, uppercase, neither)
// Requirements:
// - return an object with 3 properties
// - each property should reflect a percentage
// - each percentage should have 2 decimal points
// - assume string isnt empty
//
// Algorithm:
// - Calculate length of original string and assign to variable
// - Use Regex to match uppercase letters and assign length to variable
// - Do the same with lowercase
// - Obtain neither by subtracting uppercase and lowercase from original length
// - Return object by dividing counts by original length * 100
// - Round each to 2 decimal points

// function letterPercentages(text) {
//   var textLength = text.length;
//
//   var uppers = text.match(/[A-Z]/g) || [];
//   var lowers = text.match(/[a-z]/g) || [];
//   var upperCount = uppers.length;
//   var lowerCount = lowers.length;
//   var neitherCount = textLength - upperCount - lowerCount;
//
//   return {
//     lowercase: ((lowerCount / textLength ) * 100).toFixed(2),
//     uppercase: ((upperCount / textLength ) * 100).toFixed(2),
//     neither: ((neitherCount / textLength ) * 100).toFixed(2),
//   }
// }
//
// console.log(letterPercentages('abCdef 123')); // { lowercase: 50.00, uppercase: 10.00, neither: 40.00 }
// console.log(letterPercentages('AbCd +Ef'));   // { lowercase: 37.50, uppercase: 37.50, neither: 25.00 }
// console.log(letterPercentages('123'));        // { lowercase: 0.00, uppercase: 0.00, neither: 100.00 }

// Triangle Sides
//
// Input: 3 numbers
// Output: 'equilateral', 'scalene', 'isosceles', or 'invalid'
// Requirements:
// - To be a valid triangle, sum of 2 sides must be greater than length of longest side
// - equilateral: 3 equal lengths
// - isosceles: 2 equal length sides
// - scalene: 3 different lengths
//
// Algorithm:
// - Find the longest side
//   - Sort an array of lengths in decreasing order and grab first element
// - If the length of the other 2 sides < longest side length, return 'invalid'
//
// - If s1 === s2 && s2 === s3, return 'equilateral'
// - Else If s1 === s2 || s2 === s3, return ' isosceles'
// - Else 'scalene'

// function triangle(side1, side2, side3) {
//   var sorted = [side1, side2, side3].sort(function(a, b) {
//     return b - a;
//   });
//
//   if (sorted[0] > sorted[1] + sorted[2] || sorted[2] <= 0) {
//     return 'invalid';
//   }
//
//   if (sorted[0] === sorted[1] && sorted[1] === sorted[2]) {
//     return 'equilateral'
//   } else if (sorted[0] === sorted[1] || sorted[1] === sorted[2] || sorted[0] === sorted[2]) {
//     return 'isosceles'
//   } else {
//     return 'scalene'
//   }
// }
//
//
//
// console.log(triangle(3, 3, 3));   // equilateral
// console.log(triangle(3, 3, 1.5)); // isosceles
// console.log(triangle(3, 4, 5));   // scalene
// console.log(triangle(0, 3, 3));   // invalid
// console.log(triangle(3, 1, 1));   // invalid

// Tri-Angles
//
// Input: 3 numbers
// Output: 'acute', 'right', 'obtuse', or 'invalid'
// Requirements:
// - Return a string value that indicates what type of triangle will result gievn 3 angle values
// - Assume 3 angle values are integers and theyre in units of degrees
// - TO be a valid triangle, the angles must each be greater than 0 and add up to 180
// - If one angle is greater than 90, its obtuse
// - If one is exactly 90, its right
// - Otherwise, its acute
//
// Algorithm:
// - If its not a valid triangle, return 'invalid'
// - If the max angle is greater than 90, return 'obtuse'
// - Else if max is === 90, return 'right'
// - Else return 'acute'
//
// validTriangle:
// - if the sum is not 180, return false
// - if any of the angles are < 0, return false

// function triangle(angle1, angle2, angle3) {
//   if (!validTriangle(angle1, angle2, angle3)) {
//     return 'invalid';
//   }
//
//   var maxAngle = Math.max(angle1, angle2, angle3);
//
//   if (maxAngle > 90) {
//     return 'obtuse';
//   } else if (maxAngle === 90) {
//     return 'right';
//   } else {
//     return 'acute';
//   }
// }
//
// function validTriangle(angle1, angle2, angle3) {
//   if (angle1 + angle2 + angle3 !== 180) {
//     return false;
//   } else if (angle1 <= 0 || angle2 <= 0 || angle3 <= 0) {
//     return false;
//   } else {
//     return true;
//   }
// }
//
// console.log(triangle(60, 70, 50));   // acute
// console.log(triangle(30, 90, 60));   // right
// console.log(triangle(120, 50, 10));  // obtuse
// console.log(triangle(0, 90, 90));    // invalid
// console.log(triangle(50, 50, 50));   // invalid

// var array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
//
// var newArray = array.filter(isOddNumber);
//
// function isOddNumber(num) {
//   return num % 2 === 1;
// }
//
// console.log(newArray);

// Unlucky Days
//
// Input: year (number)
// Output: number
// Requirements:
// - write a function
// - return the number of friday the 13ths in the year
// - assume year is greater than 1752
// - assume gregorian calendar will be used in the future
//
// Algorithm:
// - Initialize count variable to 0
// - Iterate through the 13th day of the month for each month in a year
//   - if the day is equal to Friday, increment the count by 1
// - Return count variable

// function fridayThe13ths(year) {
//   var date;
//   var count = 0;
//
//   for (var i = 0; i < 12; i++) {
//     date = new Date(year, i, 13);
//
//     if (date.getDay() === 5) {
//       count++;
//     }
//   }
//
//   return count;
// }
//
// console.log(fridayThe13ths(2015)); // 3
// console.log(fridayThe13ths(1986)); // 1

// Next Featured Number Higher than a Given Value
//
// Input: number
// Output: number
// Requirements:
// - given a number, return the next "featured" number
//   - must be odd
//   - must be multiple of 7
//   - must not have digits that repeat
// - if there is no next featured, issue an error
//
// - Highest featured number: 9876543201
//
// Algorithm:
// - if number is greater than 9876654201, return "error"
// - Loop:
//   - increment number by 1
//   - if number % 7 !== 0, continue;
//   - else if number % 2 !== 1, continue;
//   - else if hasRepeatedDigits(number), continue;
//   - else, return number
//
// repeatDigits(number)
// - convert number to string
// - split string into array of chars
// - for each char in array:
//   - create regex with char
//   - look for matches in the string
//   - if the # matches > 1, return false
//   - else return true

// function featured(number) {
//   if (number > 9876543201) {
//     return "ERROR";
//   }
//
//   while (true) {
//     number++;
//
//     if (number % 2 !== 1) {
//       continue;
//     } else if (number % 7 !== 0) {
//       continue;
//     } else if (hasRepeatedDigits(number)) {
//       continue;
//     } else {
//       return number;
//     }
//   }
// }
//
// function hasRepeatedDigits(num) {
//   var str = String(num);
//   var chars = str.split('');
//
//   for (var i = 0; i < chars.length; i++) {
//     var regex = new RegExp(chars[i], 'g');
//
//     if (str.match(regex).length > 1) {
//       return true;
//     }
//   }
//
//   return false;
// }
//
// console.log(featured(12));        // 21
// console.log(featured(20));        // 21
// console.log(featured(21));        // 35
// console.log(featured(997));       // 1029
// console.log(featured(1029));      // 1043
// console.log(featured(999999));    // 1023547
// console.log(featured(999999987)); // 1023456987

// Sum Square - Square Sum
//
// Input: number
// Output: number
// Algorithm:
// - Initialize sumSquare variable and sum variable
// - Iterate from 1 to input:
//   - Add each value to the sum
//   - Add square of each value to sumSquare
// - Calculate sum ** 2 - sumSquare, return it

// function sumSquareDifference(num) {
//   var sumSquare = 0;
//   var sum = 0;
//
//   for (var i = 1; i <= num; i++) {
//     sum += i;
//     sumSquare += i ** 2;
//   }
//
//   return sum ** 2 - sumSquare;
// }
//
// console.log(sumSquareDifference(3));    // 22
// // -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
// console.log(sumSquareDifference(10));   // 2640
// console.log(sumSquareDifference(1));    // 0
// console.log(sumSquareDifference(100));  // 25164150

// Bubble Sort
//
// Input: array
// Output: array
// Requrements:
// - use bubble sort algorithm to sort the array in-place
//
// Algorithm:
// - initialize noSwaps = true
// - While noSwaps:
//   - Iterate through array:
//     - If element is less than next element:
//       - set temp variable = next
//       - set next element = current element
//       - set current element = temp
//       - set swapped to false

// Algorithm:
// - Iterate through array, comparing adjacent elements
// - If an interation completes with no swaps, stop looping and return the array

// function bubbleSort(array) {
//   var temp;
//
//   do {
//     var swapped = false;
//     for (var i = 0; i < array.length; i++) {
//       if (array[i] > array[i + 1]) {
//         temp = array[i + 1];
//         array[i + 1] = array[i];
//         array[i] = temp;
//         swapped = true;
//       }
//     }
//   } while (swapped)
//
//   return array;
// }
//
// var array = [5, 3];
// bubbleSort(array);
// console.log(array);     // [3, 5]
//
// array = [6, 2, 7, 1, 4]
// bubbleSort(array);
// console.log(array);     // [1, 2, 4, 6, 7]
//
// array = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
// bubbleSort(array);
// console.log(array);     // ['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler']

// Word to Digit
//
// Input: sentence (string)
// Output: sentence (string)
// Requirements:
// - return new string that contains original string replaced with numbers written as their word counterparts
//
// Algorithm:
// - Iterate through array of possible regex matches:
//   - For each string, create a regex
//   - Replace that regex with its corresponding number

function wordToDigit(sentence) {
  NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

  NUMBERS.forEach(function(numStr, index) {
    var regex = new RegExp(numStr, 'g');
    sentence = sentence.replace(regex, index);
  });

  return sentence;
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
//'Please call me at 5 5 5 1 2 3 4. Thanks.'

// Improvements:
// - no regex matches returns null and length of null is undefined, not 0
// - how to sort numbers in descending order
// - didn't read problem carefully and list ALL requirements in detail
// - Use Math.max and Math.min instead of sorting array
// - Didn't pass args when calling helper function
// - Used <0 instead of <= 0
// - Didn't read JavaScript Date documentation closely
// - Trying to code before flushing out algorithm and running test cases
