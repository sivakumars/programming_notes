// Input: string
// Output: boolean
// Requirements:
// - Given a list of blocks, return true if you can spell the input string by using each block once or less. Otherwise, return false.
// - Case doesnt matter
//
// Algorithm:
// - Using an array of blocks; blocks = ['bo', 'xk', ...]
// - Lowercase and Split the string into an array of chars
// - Initialize usedBlocks array to []
// - Iterate through each char in string
//   - Iterate through each block in array --> 'h', 'hu', ['bo', 'hu']
//     - if the block includes the char:
//       - if the usedBlocks array includes the block, return false
//       - else, Push the block to the usedBlocks array
// - If both loops finish, return true

function isBlockWord(str) {
  var blocks = ['bo', 'xk', 'dq', 'cp', 'na', 'gt', 're', 'fs', 'jw', 'hu', 'vi', 'ly', 'zm'];
  var chars = str.toLowerCase().split('');
  var usedBlocks = [];

  for (var i = 0; i < chars.length; i++) {
    var char = chars[i];

    for (var j = 0; j < blocks.length; j++) {
      var block = blocks[j];

      if (block.includes(char)) {
        if (usedBlocks.includes(block)) {
          return false;
        } else {
          usedBlocks.push(block);
        }
      }
    }
  }

  return true;
}

console.log(isBlockWord('BATCH')); // true
console.log(isBlockWord('BUTCH')); // false
console.log(isBlockWord('jest'));  // true
console.log(isBlockWord('floW'));  // true
console.log(isBlockWord('APPLE')); // false
console.log(isBlockWord('apple')); // false
console.log(isBlockWord('apPLE')); // false
console.log(isBlockWord('Box'));   // false
