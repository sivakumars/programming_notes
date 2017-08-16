// // Problem 1
//
// var h2s = document.getElementsByTagName('h2');
// var elements = Array.prototype.slice.call(h2s);
//
// var wordCounts = elements.map(function(element) {
//   return element.textContent.split(' ').length;
// });
//
// console.log(wordCounts);
//
// // Problem 2
//
// var one = document.getElementById('toc');
// var two = document.querySelector('#toc');
//
// // Problem 3
//
// var tocDiv = document.getElementById('toc');
// var links = tocDiv.querySelectorAll('a');
//
// for (var i = 0; i < links.length; i+=2) {
//   links[i].style.color = 'green';
// }
//
// // Problem 4
//
// var nodes = document.querySelectorAll('.thumbcaption');
// var captionsArray = Array.prototype.slice.call(nodes);
//
// var captionsText = captionsArray.map(function(caption) {
//   return caption.textContent.trim();
// });
//
// console.log(captionsText);

// Problem 5

var classification = {};

var rows = document.querySelector('.infobox.biota tbody').children;
for (var i = 5; i <= 12; i++) {
  var key = rows[i].querySelector('td').textContent;
  var value = rows[i].querySelector('td a').textContent;
  classification[key.slice(0, -1)] = value;
}

console.log(classification);
