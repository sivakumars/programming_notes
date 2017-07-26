// Implement encoding and decoding for the rail fence cipher.
//
// The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which it's encoded. It was already used by the ancient Greeks.

// In the Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zig-zag). Finally the message is then read off in rows.

function encode(text, numRails) {
  var chars = text.replace(/\s/g, '').split('');
  var nestedArrays = [];
  
  for (var i = 0; i < numRails; i++) {
    nestedArrays.push([]);
  }

  var count = chars.length;
  var nestedIndex = 1;
  var reversed = false;

  while (count > 0) {
    nestedArrays[nestedIndex - 1].push(chars.shift());
    count--;

    if (nestedIndex === 1) {
      reversed = false;
    } else if (nestedIndex === numRails) {
      reversed = true;
    }

    if (reversed) {
      nestedIndex--;
    } else {
      nestedIndex++;
    }
  }

  return [].concat.apply([], nestedArrays).join('');
}


console.log(encode('WE ARE DISC', 4)); // 'WECRADAI'
console.log(encode('WE ARE', 2));      // 'WEERA'
console.log(encode('WEA', 2));         // 'WEA'
console.log(encode('WEAR', 2));        // 'WERA'
console.log(encode('WE ARE DISCOVERED FLEE AT ONCE', 2)); // 'WECRLTEERDSOEEFEAOCAIVDEN'
