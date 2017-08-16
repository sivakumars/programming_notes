function walk(node, callback) {
  callback(node);

  for (var i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

var numImages = 0;
var numPNG = 0;

walk(document, function(node) {
  if (node.nodeName === 'IMG') {
    numImages++;
    if (node.getAttribute('src').split('.').slice(-1)[0] === 'png') {
      numPNG++;
    }
  }
});

console.log('There are ' + numImages + ' images.');
console.log('There are ' + numPNG + ' PNGs.');

// walk(document, function(node) {
//   if (node.nodeName === 'A') {
//     node.style.color = 'red';
//   }
// });
