// 1000 Lights
//
// Input: number of switches (n)
// Output: array of numbers (possible values 1 to n)
// Requirements:
// - Given n switches initially set to "off"
// - You iterate through the switches n times
// - The first time you flip every switch, the second time you flip every 2nd swtich, the third time every 3rd switch, and so on, until you reach n times
// - return the array of switches set to "on" after n repetitions
//
// 1st pass: 1y 2y 3y 4y 5y
// 2nd pass: 1y 2n 3y 4n 5y
// 3rd pass: 1y 2n 3n 4n 5y
// 4th pass: 1y 2n 3n 4y 5y
// 5th pass: 1y 2n 3n 4y 5n
//
// Therefore: 1, 4
//
// Data Structure:
// - Array - don't want to add and remove elements in the array
// - Object - more complex with parts but simpler to understand
//
// Algorithm:
// - Initialize an object with numbers 1 to n for keys and false for values
// - Iterate on i from 1 to n:
//   - Start at switchNum = 1;
//   - While (switchNum <= numSwitches),
//     - Flip object[switchNum]
//     - switchNum += i
// - Return object.keys filtered for true values

// Algorithm (using array as data structure):
// - Create an array and set indices from 1 to n as false
// - Loop from 1 to n (i)
//   - toggle the lights whose indexes are multiples of i
//   - use map to return a new array with the new toggled states each iteration
// - Filter array to return indexes of true values

// function lightsOn(numSwitches) {
//   var result = [];
//   var lights = new Array(numSwitches).fill(false);
//
//   for (var i = 1; i <= numSwitches; i++) {
//     lights = lights.map(function(light, index) {
//       if ((index + 1) % i === 0) {
//         return !light;
//       } else {
//         return light;
//       }
//     });
//   }
//
//   for (var i = 0; i < numSwitches; i++) {
//     if (lights[i]) {
//       result.push(i+1);
//     }
//   }
//
//   return result;
// }

// function lightsOn(numSwitches) {
//   var lights = {};
//
//   for (var i = 1; i <= numSwitches; i++) {
//     lights[i] = false;
//   }
//
//   for (var i = 1; i <= numSwitches; i++) {
//     var switchNum = i;
//
//     while (switchNum <= numSwitches) {
//       lights[switchNum] = !lights[switchNum];
//       switchNum += i;
//     }
//   }
//
//   var result = [];
//
//   Object.keys(lights).forEach(function(key) {
//     if (lights[key]) {
//       result.push(key);
//     }
//   });
//
//   return result;
// }

// console.log(lightsOn(5));    // [1, 4]
// console.log(lightsOn(100));  // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
