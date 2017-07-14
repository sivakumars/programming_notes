// Odd Numbers
//
// Log all odd numbers from 1 to 99, inclusive, to the console. Log all numbers on separate lines.

// for (var i = 1; i < 100; i += 2) {
//   console.log(i);
// }

// Even Numbers

// Log the even numbers from 1 to 99, inclusive, to the console. Log all numbers on separate lines.

// for (var i = 1; i < 100; i++) {
//   if (i % 2 === 0) {console.log(i);}
// }

// How Big is the Room
//
// Input: length and width numbers in the form of user-inputted strings
// Output: number (area)
// Requirements:
// - Prompt the user once for length and once for width
// - Log the area (length x width) to the console
// - Log units of both the sq meters and sq feet
// Steps:
// - Prompt the user for a length and assign value to variable
// - Prompt for width and assign value
// - Convert values to numbers
// - Multiply length and width to get sq meters
// - Multiply sq meters area by 10.7639 to get sq feet
// - Log to console.

// var SQMETERS_TO_SQFEET = 10.7639
// var length = parseInt(prompt('Enter the length of the room in meters: '), 10);
// var width = parseInt(prompt('Enter the width of the room in meters: '), 10);
//
// var areaMeters = length * width;
// var areaFeet = areaMeters * SQMETERS_TO_SQFEET;
//
// var message = 'The area of the room is ' + areaMeters.toFixed(1) + ' square meters (' + areaFeet.toFixed(2) + ' square feet).'
//
// console.log(message);

// Tip Calculator
//
// Input: bill amount (string) and tip percentage (string)
// Output: tip amount (number) and total (number)
// Requirements:
// - ignore input validation
// - assume input is numbers
// - log both tip and total with one decimal place
// Algorithm:
// - Prompt for bill and tip percentage and store in variables and conevrting to numbers
// - Multiply tip / 100 * 200 and assign value to tip
// - Add bill amount to tip and assign to total
// - Log

// var billAmount = parseFloat(prompt('What is the bill? '), 10);
// var tipPercent = parseFloat(prompt('What is the tip percentage? '), 10);
//
// var tipAmount = tipPercent / 100 * billAmount;
// var total = tipAmount + billAmount;
//
// console.log('The tip is $' + tipAmount.toFixed(1));
// console.log('The total is $' + total.toFixed(1));

// Short Long Short
//
// Input: two strings
// Output: one string
// Requirements:
// - determine longer of two input strings
// - contatengate shorter + longer + shorter
// - assume strings are never same length
// Algorithm:
// - If the first string is longer:
//   - assign first to long variable
//   - assign second to short variable
// - Else:
//   - assign second string to long variable
//   - assign first to short variable
// - return short + long + short

// function shortLongShort(str1, str2) {
//   if (str1.length > str2.length) {
//     return str2 + str1 + str2;
//   } else {
//     return str1 + str2 + str1;
//   }
// }
//
// console.log(shortLongShort('abc', 'defgh'));   // "abcdefghabc"
// console.log(shortLongShort('abcde', 'fgh'));   // "fghabcdefgh"
// console.log(shortLongShort('', 'xyz'));        // "xyz"

// Leap Years Part 1
//
// Input: year (number)
// Output: boolean
// Requirements:
// - return true if year is divisible by 4 but not divisble by 100
// - return false if divisble by 100 unless divisible by 400
// - assume input is greater than 0
// Algorithm:
// - If the year is divisible by 400, return true
// - Else if the year is divisble by 100, return false
// - else if year is divisible by 4, return true
// - else, return false

// function isLeapYear(year) {
//   if (year % 400 === 0) {
//     return true;
//   } else if (year % 100 === 0) {
//     return false;
//   } else if (year % 4 === 0) {
//     return true;
//   } else {
//     return false;
//   }
// }
//
// console.log(isLeapYear(2016));     // true
// console.log(isLeapYear(2015));     // false
// console.log(isLeapYear(2100));     // false
// console.log(isLeapYear(2400));     // true
// console.log(isLeapYear(240000));   // true
// console.log(isLeapYear(240001));   // false
// console.log(isLeapYear(2000));     // true
// console.log(isLeapYear(1900));     // false
// console.log(isLeapYear(1752));     // true
// console.log(isLeapYear(1700));     // false
// console.log(isLeapYear(1));        // false
// console.log(isLeapYear(100));      // false
// console.log(isLeapYear(400));      // true

// Leap Years Part 2
//
// Requirements:
// - If the year is divisible by 400, return true
// - Else if the year is divisble by 100, return false
// - else if year is divisible by 4, return true
// - else, return false
// - If year is before 1752, all years divisible by 4 are true
// Algorithm:
// - If the year < 1752 and divisible by 4, return true

// function isLeapYear(year) {
//   if (year < 1752 && year % 4 === 0) {
//     return true;
//   } else if (year % 400 === 0) {
//     return true;
//   } else if (year % 100 === 0) {
//     return false;
//   } else {
//     return (year % 4 === 0);
//   }
// }
//
// console.log(isLeapYear(2016));
// console.log(isLeapYear(2015));
// console.log(isLeapYear(2100));
// console.log(isLeapYear(2400));
// console.log(isLeapYear(240000));
// console.log(isLeapYear(240001));
// console.log(isLeapYear(2000));
// console.log(isLeapYear(1900));
// console.log(isLeapYear(1752));
// console.log(isLeapYear(1700));
// console.log(isLeapYear(1));
// console.log(isLeapYear(100));
// console.log(isLeapYear(400));

// Multiples of 3 and 5
//
// Input: number
// Output: number
// Requirements:
// - compute sum of all numbers between 1 and input that are multiples of 3 or 5
// - assume input is a number > 1
// Algorithm:
// - Initialize sum variable
// - For loop from 1 up to and including the input
//   - If the index % 3 === 0 or index % 5 === 0, add it to sum
// - Return sum

// function multisum(maxValue) {
//   var sum = 0;
//
//   for (var i = 1; i <= maxValue; i++) {
//     if (i % 3 === 0 || i % 5 === 0) {
//       sum += i;
//     }
//   }
//
//   return sum;
// }
//
// console.log(multisum(3));      // 3
// console.log(multisum(5));      // 8
// console.log(multisum(10));     // 33
// console.log(multisum(1000));   // 234168
//
// ASCII String Value
//
// Input: text
// Output: number
// Requirements:
// - Add up the ASCII string values of each character in the input string
// - You may use charCodeAt() method
// Algorithm:
// - Initialize sum to 0
// - For loop through each character in string
//   - Add ascii vaue to sum

// function asciiValue(text) {
//   // var sum = 0;
//   //
//   // for (var i = 0; i < text.length; i++) {
//   //   sum += text[i].charCodeAt();
//   // }
//
//   return text.split('').reduce(function (sum, char) {
//     return sum + char.charCodeAt();
//   }, 0);
// }
//
// console.log(asciiValue('Four score'));         // 984
// console.log(asciiValue('Launch School'));      // 1251
// console.log(asciiValue('a'));                  // 97
// console.log(asciiValue(''));                   // 0
