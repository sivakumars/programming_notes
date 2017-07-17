// Cute Angles
//
// Input: floating point angle (number)
// Output: angle in degrees/minutes/seconds (string)
// Requirements:
// - convert the floating point number to degrees, minutes, seconds
// - 60 minutes in a degree
// - 60 seconds in a minute
// - Use '˚' for degrees
// - Use "''" for minutes
// - Use '"' for seconds
// - The seconds and minutes must show two digit zero values
// Algorithm:
// - Set degrees = Math.floor(angle)
// - Set minutes = Math.floor(angle % degrees * 60)
// - Set seconds = Math.floor(angle % degrees * 60 % minutes * 60)
// - Return string with proper formatting

// function dms(angle) {
//   var degrees = Math.floor(angle);
//   var minutes = Math.floor((angle - degrees) * 60);
//   var seconds = Math.floor(((angle - degrees) * 60 - minutes) * 60);
//
//   return String(degrees) + '\xB0' + prependZeros(minutes) + "'" + prependZeros(seconds) + '"';
// }
//
// function prependZeros(number) {
//   if (String(number).length < 2) {
//     return '0' + String(number);
//   } else {
//     return String(number);
//   }
// }
//
// console.log(dms(30));        // 30°00'00"
// console.log(dms(76.73));     // 76°43'48"
// console.log(dms(254.6));     // 254°35'59"
// console.log(dms(93.034773)); // 93°02'05"
// console.log(dms(0));         // 0°00'00"
// console.log(dms(360));       // 360°00'00" or 0°00'00"

// Combining Arrays
//
// Input: two arrays
// Output: one array
// Requirement:
// - return union of both arrays, meaning all elements form both arrays but with duplicates removed
// - assume inputs are always arrays
// Algorithm:
// - Concatenate both input arrays
// - Initialize output array
// - For each element in concatenated array
//   - if the output array doesnt contain it, push the value to the output array
// - Return output array

// function union(arr1, arr2) {
//   var resultArray = arr1.slice();
//
//   arr2.forEach(function(element) {
//     if (resultArray.indexOf(element) < 0) {
//       resultArray.push(element);
//     }
//   });
//
//   return resultArray;
// }
//
// console.log(union([1, 3, 5], [3, 6, 9])); // [1, 3, 5, 6, 9]

// Halvsies
//
// Input: 1 array
// Output: 2 arrays
// Requirement:
// - Place the first half of the array in one array and the second half in the second array
// - If there is an odd number, place the extra element at the end of the first half
// - If there is an empty input, return 2 empty arrays
// Algorithm:
// - Use slice

// function halvsies(elements){
//   var arr1 = elements.slice(0, Math.ceil(elements.length/2));
//   var arr2 = elements.slice(Math.ceil(elements.length/2));
//
//   return [arr1, arr2]
// }
//
// console.log(halvsies([1, 2, 3, 4]));    // [[1, 2], [3, 4]]
// console.log(halvsies([1, 5, 2, 4, 3])); // [[1, 5, 2], [4, 3]]
// console.log(halvsies([5]));             // [[5], []]
// console.log(halvsies([]));              // [[], []]

// Find the Duplicate
//
// Input: Array
// Output: Value
// Requirements:
// - Return the first duplicate value from the array
// Algorithm:
// - Create nonDupes array
// - For loop through input array
//    - If the current value is in the nonDupes array, return it
//    - Else, push it to the nonDupes array

// function findDup(array) {
//   var nonDupes = [];
//
//   for (var i = 0; i < array.length; i++) {
//     if (nonDupes.indexOf(array[i]) === -1) {
//       nonDupes.push(array[i]);
//     } else {
//       return array[i];
//     }
//   }
// }
//
// console.log(findDup([1, 5, 3, 1]));                              // 1
// console.log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
//          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
//          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
//          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
//          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
//          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
//          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
//          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
//          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
//          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]));  // 73

// Combine Two Lists
//
// Input: 2 arrays
// Output: 1 array
// Requirements:
// - Combine arrays into 1 array, alternating elements from each array
// - Both arrays are non-empty
// - Both arrays have equal number of elements
// Algorithm:
// - Initialize results array
// - While index is less than the length of an array
//   - Push value from each array to results array
//   - Increement index
// - Return results array

// function interleave(arr1, arr2) {
//   var results = [];
//   var index = 0;
//
//   while (index < arr1.length) {
//     results.push(arr1[index], arr2[index]);
//     index++;
//   }
//
//   return results;
// }
//
// console.log(interleave([1, 2, 3], ['a', 'b', 'c'])); // [1, 'a', 2, 'b', 3, 'c'])

// Multiplicative Average
//
// Input: array of nmbers
// Output: string rounded to 3 decimals
// Requirements:
// - return the average of the numers rounded to 3 decimal places
// - return a string
// Algorithm:
// - Sum the numbers in the array
// - Divide the sum by the length of the array
// - fix the result to 3 decimal places

// function showMultiplicativeAverage(numbers) {
//   var product = numbers.reduce(function(product, number) {
//     return product * number;
//   });
//
//   return (product / numbers.length).toFixed(3);
// }
//
// console.log(showMultiplicativeAverage([3, 5]));                // '7.500'
// console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));  // '28361.667'

// Multiply Lists
//
// Input: 2 arrays of numbers
// Output: 1 array of numbers
// Requirements:
// - Each element in output array contains product of input array numbers at same index value
// - Assume arrays contain same number of elements
// - Return new array
// Algorithm:
// - Initialize products array
// - For each element in one array
//   - Multiply the element by the element at the same index in the second array and push result to results array
// - Return results array

// function multiplyList(arr1, arr2) {
//   return arr1.map(function(element, index) {
//     return element * arr2[index];
//   });
// }
//
// console.log(multiplyList([3, 5, 7], [9, 10, 11])); // [27, 50, 77])

// Digits List
//
// Input: number
// Output: array of numbers
// Requirements:
// - Return an array containing the digits of the input number
// - Input is always positive
// ALgorithm:
// - Convert the input to a string
// - Split the string into an array of chars
// - Convert array of chars --> array of numbers
// - Return array of numbers

// function digitList(number) {
//   return String(number).split('').map(Number);
// }
//
// console.log(digitList(12345));       // [1, 2, 3, 4, 5]
// console.log(digitList(7));           // [7]
// console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
// console.log(digitList(444));         // [4, 4, 4]

// How Many
//
// Input: array of elements
// Output: log each element and its count
// Requirements:
// - count the number of occurences of each element
// - log each elements value along with the number of times it occurs in the array
// Algorithm:
// - Create count object
// - Loop through array
//   - If value doesnt exists in object, initialize it to value of 0
//   - Increment value in object
// - Loop through object
//   - log each value and occurrence

// function countOccurrences(array) {
//   var count = {};
//
//   array.forEach(function(element) {
//     if (!count[element]) {
//       count[element] = 0;
//     }
//
//     count[element]++;
//   });
//
//   for (var property in count) {
//     console.log(property + ' => ' + count[property]);
//   }
// }
//
// var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck'];
// countOccurrences(vehicles);

// Array Average
//
// Input: array of numbers
// Output: number
// Requirements:
// - compute average of numbers
// - round down (Math.floor)
// - array is non-empty and always has positive numbers
// Algorithm:
// - Compute sum of numbers
// - Divide sum by length of input to get average
// - Take the floor of the average

// function average(numbers) {
//   var sum = numbers.reduce(function(sum, number) {
//     return sum + number
//   });
//
//   return Math.floor(sum / numbers.length);
// }

console.log(average([1, 5, 87, 45, 8, 8]));    // 25
console.log(average([9, 47, 23, 95, 16, 52])); // 40
