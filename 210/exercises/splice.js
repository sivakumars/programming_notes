// Problem: Implement the splice function
//
// Requirements:
// - write a function named 'mySplice'
// - input:
//   - array
//   - startIndex
//   - deleteCount
//   - optional items to add to the array
// - given an input array, remove elements from the array starting at the startIndex
// - remove the number of elements indicated by the deleteCount
// - if optional items are provided, add those elements starting at the startIndex
//   - the remaining arrays elements that weren't deleted should begin right after the inserted elements
//
// Algorithm:
// - Given input array, remove elements
// - Insert elements
//
//
// Algorithm:
// - Grab optional arguments and place in array
// - Iterate on input array from 0 to startIndex, push values
// - Push arguments
// - Iterate from start + deleteCount to end of array, pushv alues


function splice(array, startIndex, deleteCount) {
  var arguments = Array.prototype.slice.call(arguments).slwice(3);
  var arrayCopy = array.slice();
  array.length = 0;
  var removedValues = [];

  for (var i = 0; i < startIndex; i++) {
    array.push(arrayCopy[i]);
  }

  for (var i = 0; i < arguments.length; i++) {
    array.push(arguments[i]);
  }

  for (var i = startIndex + deleteCount; i < arrayCopy.length; i++) {
    array.push(arrayCopy[i]);
  }

  return arrayCopy.slice(startIndex, startIndex + deleteCount);
}

console.log(splice([1, 2, 3], 1, 2));                   // [2, 3]
console.log(splice([1, 2, 3], 1, 3));                   // [2, 3]
console.log(splice([1, 2, 3], 1, 0));                   // []
console.log(splice([1, 2, 3], 0, 1));                   // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));              // []

var arr = [1, 2, 3];
console.log(splice(arr, 1, 1, 'two'));                  // [2]
console.log(arr);                                       // [1, 'two', 3];

var arr = [1, 2, 3];
console.log(splice(arr, 1, 2, 'two', 'three'));         // [2 ,3]
console.log(arr);                                       // [1, "two", "three"]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 0));                         // []
console.log(splice(arr, 1, 0, 'a'));                    // []
console.log(arr);                                       // [1, 'a', 2, 3]

var arr = [1, 2, 3];
console.log(splice(arr, 0, 0, 'a'));                    // []
console.log(arr);                                       // ['a', 1, 2, 3]
