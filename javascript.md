219 Study Guide
=================

Notes created while preparing for Assessment 219. This assessment is designed to test knowledge of course 210 and will focus on Computational Thinking and JavaScript Programming.

Introduction
------------

**JavaScript** is a high-level, interpreted, object-oriented programming language that was created in 1994 by Brendan Eich. The purpose of the language was to provide a way for web sites to be dynamic and more interactive.

Variables
----------

In JavaScript, variables are declared before they are used with the `var` keyword. After a variable is declared, you can use the `=` operator to assign a value to it. Any variable that is declared (but not assigned) is initialized to the value `undefined`.

```javascript
var name;
console.log(name);      // "undefined"
console.log(last_name); // ReferenceError
```

JavaScript is a *loosely typed* or *dynamically typed* language, meaning you don't have to declare the data type of a variable ahead of time. In addition, you can reassign a variable to a different data type without error.

Primitive Data Types
-------------------

A **primitive** is a data type that represents one single value; it's not an object.  JavaScript (ES5) contains five primitive data types: `number`, `boolean`, `string`, `null`, and `undefined`.

All primitives are *immutable*, in other words, their value cannot be changed in memory by any operation. Therefore, to change the value of a primitive variable, it must be reassigned to a new value.

All other data types in JavaScript, including arrays and functions, are objects. An object is a container that can hold primitives or other objects. Objects *are* mutable, which means you can modify their contents without reassignment.

Except for `null` and `undefined`, all primitives have object equivalents that wrap around their primitive values. This means that each primitive value actually has access to properties and methods, and can be treated as if it were an object.

### Number

Unlike most other languages, JavaScript uses a floating point system to represent numbers. A common issue that arises from this implementation is that there seem to be rounding errors when performing number operations.

`0.1 + 0.1; // returns 0.30000000000000004, not 0.3!`

Therefore, it's best to avoid fractional numbers and instead use an integer of the smallest relative units. For example, if you're working with money, represent the amount in an integer value of cents rather than a decimal value of dollars. And when working with time, use seconds rather than hours.

### NaN

The special number value of `NaN` indicates an illegal operation was performed with a number.

```javascript
Number('abc'); // NaN
Math.sqrt(-1); // NaN
undefined + 1; // NaN
```

Weirdly, comparing `NaN` with any value (including `NaN`) evaluates to `false`.

```javascript
NaN === NaN;   // false
```

To help determine if a value is `NaN`, JavaScript provides an `isNaN` function that returns `true` for any value that is "not a number".

```javascript
isNaN(NaN);     // true
isNaN('WTF');   // true
typeof(NaN);    // "number"
```

The problem is that `isNaN` doesn't actually check if a value is `NaN`. Rather, it returns `true` if a value is not of type `number` OR has the value `NaN`. Since we know that `NaN` is the only value of type `number` that also returns `true` when passed to `isNaN`, we can use those facts to create a function that determines if a value is `NaN`.

```javascript
function isValueNaN(value) {
  return typeof(value) === "number" && isNAN(value);
}
```

In conclusion, `NaN` is somehow "not a number" and of type `number` at the same time. Ugh!

Explicit Type Conversions
--------------------------

A **coercion** or **conversion** is an operation that attempts to convert a variable from one data type to another. Since primitives are immutable, JavaScript can't actually "convert" the values in-place, so instead it returns a new value of the intended data type.

Although there are two ways used to convert strings to numbers, the `parseInt` method (with an optional radix) is preferred.

```javascript
Number('123');            // 123
Number('abc123');         // NaN
parseInt('123', 10);      // 123
parseInt('123.1', 10);    // 123
parseFloat('123.1');      // 123.1
```

Primitive values can be converted to a string with either the String constructor function or by calling the `toString` method on an object. The constructor method is preferred because it doesn't thrown an error when passing `null` or `undefined`.

```javascript
String(123);              // "123"
(123).toString();         // "123"
String(false);            // "false"
false.toString();         // "false"
String(null);             // "null"
(null).toString();        // TypeError
```

The `Boolean()` function can convert any value into a boolean based on JavaScript's truthiness rules.

```javascript
Boolean(false);           // false
Boolean(null);            // false
Boolean(undefined);       // false
Boolean(0);               // false
Boolean(NaN);             // false
Boolean('');              // false
Boolean(' ');             // true
Boolean(1);               // true
Boolean(true);            // true
```

But since all non-empty strings are truthy, don't expect "false" to be converted to `false`. Instead, convert a boolean to a string and compare it to "true".

```javascript
Boolean('false');         // true

var b = String(false);
b === 'true';             // false
```

Implicit Type Conversions
-------------------------

When evaluating expressions involving different data types, JavaScript will attempt to **implicitly** (or automatically) convert one of the types to match the other. While it seems convenient, implicit conversions can result in unexpected bugs, and therefore should be avoided. It's good, however, to be familiar with them since they are used often in the wild.

### Plus (+) Operator

The unary plus operator converts values into numbers.

```javascript
+('123');         // 123
+('abc123');      // NaN
+(undefined);     // NaN
+('');            // 0
+(null);          // 0
+(false);         // 0
+(true);          // 1
```

The binary plus operator performs addition on numbers or concatenation on strings. If an expression contains both a string and a non-string (i.e. number), the non-string is implicitly converted to a string and concatenation takes precedent.

```javascript
1 + true;         // 2
'123' + 123;      // "123123"
123 + '123';      // "123123"
'a' + null;       // "anull"
```

### Other Arithmetic Operators

Since the `-`, `*`, `/`, and `%` operators are only defined for numbers, JavaScript attempts to convert both operands to numbers.

```javascript
2 - true;         // 1
'123' * 3;        // 369
'8' - '1'         // 7
```

### Relational Operators

The relational operators (`>`, `<`, `>=`, `<=`) perform numeric comparison for numbers and lexicographic order comparison for strings. If an expression contains multiple data types, non-numbers are converted to numbers and numeric comparison is performed.

```javascript
50 > 6;           // true
50 > '6';         // true
'50' > '6'        // false
123 > 'a';        // false (because 'a' is coerced to NaN)
123 <= 'a';       // false (because comparison with NaN is always false)
```

### Equality Operators

With the basic equality (`==`) operator, JavaScript tries to implicitly convert operands of different types. Therefore, it's best to use strict equality (`===`) which does not perform any type conversions.

```javascript
var str = '3';
var num = 3;

str == num;  // true
str === num; // false
```

### Logical Operators

Logical operators **do not** always return boolean values.

For AND (`&&`), if the first operand is "falsy", it is returned. Otherwise, the second operand is returned.

For OR ('||'), if the first operand is "truthy", it is returned. Otherwise, the second operand is returned.

### Increment and Decrement Operators

With a standalone expression, it doesn't matter whether the increment (`++`) or decrement (`--`) operators appear before or after the variable.

When part of an assignment, however, they behave differently.

```javascript
var a;
var b;
var c;

a = 1;
b = a++;    // b = 1; a = 2
c = ++a;    // a = 3; c = 3
```

Conditionals
-------------

In JavaScript, `if...else` works as expected. The `switch` statement, however, has a unique quirk. As expected, the `switch` statement looks for the first `case` label that matches. But instead of then exiting the statement, it continues to execute all subsequent `case` and `default` blocks (regardless of whether they match) until it encounters a `break` or the entire `switch` statement ends. To correct this "fall-through" behavior, it's best practice to insert a `break` at the end of each `case` statement.

```javascript
var condition = 'yes';

switch(condition) {
  case 'yes':
  console.log('This should be logged.');
  break;
  case 'no':
  console.log('This should not be logged.');
  break;
  default:
  console.log('I am boring.')
}

// console output
'This should be logged.'
```

Functions
---------

A function is a piece of code that executes a list of instructions and returns a value. A function name is simply a local variable that happens to have a function as its value. The code below declares a variable `startle` with a function as its value. A function is called using the function name and appending `()`.

```javascript
function startle() {
  console.log('Yikes!');
}

var surprise = startle;

surprise();                  // logs: "Yikes" and returns "undefined"
```

If a function does not contain an explicit `return` statement, the function returns the value `undefined`.

During execution, any passed arguments are made available to the function as local variables with the same names as the function's parameters. Somewhat confusingly, within the function body, we call them arguments.

```javascript
function add(a, b) {
  return a + b
}

add(1, 3);                  // 4
add(1, 3, 5);               // 4
add(1);                     // NaN (1 + undefined = NaN)
```

Note that calling a function with more or less arguments than actually defined *does not raise an error*. Any extra arguments are ignored and any missing arguments are initialized to `undefined`.

### Function Arguments Object

The `arguments` object is an *Array-like* local variable that is available inside every function and contains all arguments passed to the function, no matter how many parameters the function's definition included.

The `arguments` object has a `length` property and its elements can be accessed using bracket notation. Beyond that, it does not itself support any other features of an `Array`. You can, however, copy its elements into an `Array` object using the `slice` method.

```javascript
var args = Array.prototype.slice.call(arguments);
```

Variable Scope
---------------

A variable's scope is defined by where the variable was declared and determines where in a program the variable is accessible.

### Lexical Scope

JavaScript is said to have "lexical scope". This means (1) that the scope of a variable is determined by its position in the code hierarchy and (2) that code has access to any variables defined in a surrounding (or outer) scope.

When a line of code attempts to retrieve a variable, JavaScript first searches the current scope and then proceeds to search the surrounding scopes one-by-one. Once it finds a match, it returns its value.

This variable lookup process means that variables declared in an inner scope may *shadow* (or hide) a variable that has the same name but was declared in an outer scope.

### Function Scope

In JavaScript, every function creates a new scope. In addition (and different from Ruby), functions have direct access to any variables defined in surrounding scopes.

Specifically, a function has access to variables that were available where the function was defined but not necessarily where the function is called. In other words, every JavaScript function is actually a **closure**, in that it has access to (or encloses) its function definition *and* the environment in which that function was defined.

```javascript
var first_name = 'Nitin';

function greet() {
  var last_name = 'Savant'
  console.log(first_name + ' ' + last_name);
}

greet();                    // Logs: "Nitin Savant" and returns "undefined"
console.log(first_name);    // Logs: "Nitin" and returns "undefined"
console.log(last_name);     // ReferenceError: last_name is not defined
```

In the example above, the `greet` function can access `first_name` that was declared in a surrounding scope. And it can access `last_name` that was declared in its current scope. But, the surrounding scope cannot access `last_name` because it's only accessible within the function.

Variable Assignment
-------------------

When assigning a variable without the `var` keyword, JavaScript performs a similar lookup from current scope to surrounding scopes one-by-one until it finds a matching variable name to reassign.

```javascript
var country1 = 'India';

function assign() {
    country1 = 'Slovenia';
}

assign();
console.log(country1);      // Logs: "Slovenia"
```

If it can't find a match, JavaScript will **declare and assign a new global variable**.


```javascript
function assign() {
  country1 = 'Slovenia';
  var country2 = 'India';
}

assign();
console.log(country1);      // Logs: "Slovenia" (country1 is global)
console.log(country2);      // ReferenceError: country2 is not defined (country2 is local to function)
}
```

This behavior is a source of subtle bugs, and therefore it's best to make sure you've already declared a variable in some nearby scope before you reassign it.

Function Expressions
--------------------

A function can also be defined with a **function expression**. A function expression defines a function as part of a variable assignment. In the code below, we define an anonymous function and assign it to the variable `greet`.

```javascript
var greet = function () {
  return 'hello';
};

greet();                    // "hello"
```

Hoisting
-------

The practical difference between using function declarations or function expressions is understood by explaining JavaScript's **hoisting** behavior.

When JavaScript code is executed, the interpreter first looks for function declarations and loads them into memory. Next, it looks for variable declarations and loads them into memory. If a variable is declared and assigned together, only the variable declaration is hoisted. Finally, the interpreter returns to the top of the code and runs the remaining lines in order.

In other words, function and variable declarations are essentially "hoisted" to the top of their scope; it's practically the same as writing them at the top of their scope.


```javascript
console.log(a);     // Logs: "undefined"
console.log(b);     // ReferenceError: b is not defined.

var a = 'hello';    // "var a;" is hoisted to the top

console.log(a);     // Logs: "hello"
```

In the code above, `var a` is hoisted above `console.log(a)`, which is why it logs "undefined" as opposed to throwing a ReferenceError as it does for `console.log(b)`.

Since function expressions are just variable declarations, they behave similarly. The variable declaration is hoisted but the function definition (i.e. variable assignment) remains.

```javascript
console.log(hello());           // TypeError: hello is not a function
console.log(goodbye());         // ReferenceError: goodbye is not defined

var hello = function () {
  return 'hello';
};

console.log(hello());           // Logs: "hello"
```

Objects
--------

In JavaScript, objects serve multiple roles. As in Ruby, an object can be used as a container to bundle related data and behavior. Using objects in this manner, programs can be written in an object-oriented style.

Since objects are structured simply as *name-value* pairs, they can be used as hashes (or associative arrays). In JavaScript, the *name-value* pairs are known as the object's properties.

When a function is assigned as an object's property, we call it a **method**.

### Object Literal

Objects are created and initialized with an object literal. The property name for an object can be any valid string and the property value can be any valid expression. If the property name is not a valid identifier or non-negative integer, it must be enclosed in quotes.

**Note:** A valid identifier must contain alphanumeric characters and must not start with a digit.

```javascript
var object = {
  a: 1,
  2: 'hello',
  '2b': 2 + 1,
  'a b': {
        first: 'Nitin',
        last: 'Savant',
  },
};
```

### Accessing and Assigning Properties

Properties (that are valid identifiers) can be accessed and assigned using "dot-notation". Like a declared variable, a property that wasn't ever assigned returns `undefined`.

```javascript
var name = {
  first: 'Nitin',
};

name.first                // 'Nitin'
name.last                 // undefined
name.last = 'Savant'      // 'Savant'
name                      // { first: 'Nitin', last: 'Savant' }
```

To access and assign properties that are not valid identifiers, "bracket-notation" must be used. Unless passing an expression (e.g. variable, number), quotes are required. An expression cannot be passed using dot-notation.

```javascript
var object = {
  a: 1,
  2: 'hello',
  '2b': 3,
};

var num = 2;

object.a;         // 1

object.2;         // SyntaxError: Unexpected number
object[2];        // 'hello'
object[num];      // 'hello'

object[2b] ;      // SyntaxError: Invalid or unexpected token
object['2b'] ;    // 3
```

The `delete` operator is available to remove a property from an object.

```javascript
var name = {
  first: 'Nitin',
  last: 'Savant',
};

delete name.first;
name;                       // { last: 'Savant' }
```

Arrays
-------

Arrays are the basic collection type used in JavaScript. Arrays are created and initialized with an array literal and are zero-indexed by non-negative integers. Arrays have their own set of properties and methods.

```javascript
var array = [];
array = [1, 2, 3];
array.length;       // 3
array[1];           // 2
```

In JavaScript, however, arrays are actually just a type of object.

```javascript
var array = [];
typeof array;   // "object"
```

Like an object, an array can assign and access properties.

```javascript
var array = [1, 2, 3];
array['name'] = 'Nitin';
array;                    // [ 1, 2, 3, name: 'Nitin' ]
array[2];                 // 3
array[3];                 // undefined
array['name'];            // 'Nitin'
array.name;               // 'Nitin'
```

To determine whether a value is an Array or an Object, JavaScript provides the `Array.isArray()` function. Even when you add properties to an array, it remains an array.

```javascript
var array = [];
Array.isArray(array);     // true

array['name'] = 'Nitin';
array;                    // [ name: 'Nitin' ]
Array.isArray(array);     // true
```

When assigning a value to an Array, if the index value is a non-zero integer or can be coerced to a non-zero integer, the value is assigned as an element of the Array. If it cannot be coerced, it is assigned as an object property.

```javascript
var arr = [];

arr[0] = 'a';
arr['1'] = 'b';  // assigned as element with index = 1
arr[-1] = 'c';   // assigned as property with key of '-1'

console.log(arr);       // ["a", "b", -1: "c"]
```

### Length Property

Each Array object has a `length` property that returns a value one greater than the largest array index. If there are no elements in the array, it returns `0`.

```javascript
var array = [];
array.length;                       // 0

array = ['Nitin', 'Savant'];
array.length;                       // 2

array['middle'] = 'Gajendra';

array.length;                       // 2
Object.keys(array).length;          // 3
```

If adding properties to an array, the `Object.keys` function must be used to count the total properties.

While you can use the `delete` method on an array, it's best to use `splice` instead.

Pass-by-Reference vs. Pass-by-Value
-----------------------------------

### Primitives

When assigning a primitive value to a variable, JavaScript creates a new value in memory and points the variable to it. If you intend to create a second variable and assign it the same value as the first variable, JavaScript will create a completely new value in memory containing a *copy* of the first variable's value.

Since they are pointing to two different values in memory, anything done with the first variable will never affect the second variable.

```javascript
var first = 'Nitin';
var second = first;

var first = 'Savant';
second;                 // 'Nitin'
```

This demonstrates that JavaScript is *pass-by-value*, at the very least when dealing with primitives.

### Objects

At first, objects appear to behave similar to primitives. In the example below, a second variable is assigned to the same value as the first variable. As with primitives, when we reassign the first variable to a new object, JavaScript creates a new value in memory and the second variable is unaffected.

```javascript
var first = { name: 'Nitin' };
var second = first;

first = { name: 'Savant'}
second;                 // { name: 'Nitin' }
```

Since reassigning the second variable does not affect the first variable, JavaScript is theoretically *pass-by-value* for objects too. Practically, however, there is an important distinction between the behavior of primitives and objects.

```javascript
var first = { name: 'Nitin' };
var second = first;

first.name = 'Savant';
second;                 // { name: 'Savant' }
```

In this example, instead of reassigning the first object, we reassigned a property of the first object, and that **did affect** the second object.

When JavaScript assigns the second variable, it doesn't create a copy of the first variable's object properties; instead it creates a reference that points to the same set of properties. Therefore, when you modify the properties of either object, the other object's properties are also modified, since they are simply the same properties.

Due to this critical distinction, beginners are often taught that Javascript is *pass-by-value* for primitives and *pass-by-reference* for objects. That can help with remembering the practical differences between primitives and arrays but it's not technically true. A simpler way to think of things when it comes to JavaScript is to remember that primitives are *immutable* while objects are *mutable*.

### Mutability

When we say primitives are *immutable*, we mean that you cannot modify them in place. Any operations on primitives will return a new value that will occupy a new place in memory.

Objects are *mutable*, meaning that the properties within them can be modified  without changing the identity of the object. In other words, you can modify an object without having to return a new object.

Let's compare with Ruby with JavaScript. In Ruby, booleans and numbers are *immutable* while strings and arrays are *mutable*. Like JavaScript, Ruby is theoretically always *pass-by-value* because reassigning the first variable does not affect the second variable.

```ruby
first = 'Nitin'
second = first

first = 'Savant'
second              # 'Nitin'
```

But unlike JavaScript, Ruby strings are mutable and a destructive method (like `<<`) can change the value of the first string in place.

```ruby
first = 'Nitin'
second = first

first << ' Savant'
second              # 'Nitin Savant'
```

While both Ruby and JavaScript are *pass-by-value*, their individual behavior related to the mutability of their data types is different.

Pure Functions and Side Effects
-------------------------------

In JavaScript, functions can access and reassign variables defined in a surrounding scope. In addition, functions can mutate objects passed in as arguments. These reassignments and mutations are called **side effects**.

If a function doesn't have any side effects, we call it a **pure function**. A pure function relies only on its passed arguments to determine its return value, does not mutate any objects, *and* always returns a value. Given the same arguments, a pure function will always return the same result.

A **closure** is a function that contains a reference to a variable in a surrounding scope. Therefore, by definition a closure *is not* a pure function.

To code more clearly when using pure functions, there are a few practices to follow:

1) Convert functions to pure functions whenever possible to eliminate side effects and possible bugs. In this example, instead of mutating `array` directly, `newArray` is initialized and returned.

```javascript
var numbers = [1, 2, 3];

function deleteElements(array, numToDelete) {
  var newArray = [];

  for (var i = 0; i < array.length - numToDelete; i++) {
    newArray.push(array[i]);
  }
  return newArray;
}

deleteElements(numbers, 2);             // [1]
numbers;                                // [1, 2, 3]

numbers = deleteElements(numbers, 2);   // [1]
```

2) In the example below, since the return value of `add` function is assigned to the `result` variable, you can tell that the programmer expects `add` to behave as a pure function.

```javascript
function add(num1, num2) {
  return num1 + num2;
}

result = add(3, 5);
result;                     // 8
```

3) When defining a function with side effects, accept the variable to be mutated as an argument.

```javascript
var numbers = [1, 2, 3];

function deleteElements(array, numToDelete) {
  array.length = array.length - numToDelete;
  return array;
}

deleteElements(numbers, 2);    // [1]
numbers;                       // [1]
```

Common String Methods
---------------------

```javascript
String(null);                         // 'null'

'string'.length;                      // 6

'string' + 'cheese';                  // 'stringcheese'

'string'[3];                          // 'i'

'strings'.indexOf('s');               // 0
'strings'.lastIndexOf('s');           // 6

'strings'.includes('s');              // true

'strings'.match(/s/g);                // ['s', 's']
'strings'.match(/v/);                 // null

'strings'.replace(/s/g, 'gs');        // 'gstringgs'

's'.repeat(4);                        // 'ssss'

'strings'.slice(1, 3);                // 'tr'
'strings'.slice(1);                   // 'trings'
'strings'.slice(-2);                  // 'gs'   
```

Common Array Methods
--------------------

```javascript
[1, 2, 3].length;               // 3

Array.isArray([1, 2, 3]);       // true

var arr = [1, 2, 3];          
var arrCopy = arr.slice();      // [1, 2, 3]

function list() {
  return Array.prototype.slice.call(arguments);
}

list(1, 2, 3);                  // [1, 2, 3]

arr = [1, 2, 3];
arr.pop();                      // 3
arr;                            // [1, 2]

[1, 2, 3].reverse();            // [3, 2, 1]

arr = [1, 2, 3];
arr.shift();                    // 1
arr;                            // [2, 3]

arr = [1, 2, 3];
arr.push(4);                    // 4
arr;                            // [1, 2, 3, 4]

arr = [1, 2, 3];              
arr.unshift(4);                 // 4
arr;                            // [4, 1, 2, 3]

[3, 2, 1].sort();               // [1, 2, 3]

arr = [1, 2, 3, 4, 5];
arr.splice(2, 2);               // [3, 4]
arr;                            // [1, 2, 5]

arr = [1, 2, 3, 4, 5];
arr.splice(2, 2, 6, 'h');       // [3, 4]
arr;                            // [1, 2, 6, 'h', 5]

[1, 2, 3, 4, 5].slice(3);       // [4, 5]
[1, 2, 3, 4, 5].slice(3, 5);    // [4, 5]
[1, 2, 3, 4, 5].slice(-2);      // [4, 5]


[1, 2].concat([3, 4]);          // [1, 2, 3, 4]
[1, 2].concat(3, 4);            // [1, 2, 3, 4]

arr = [1, 2];
arr.push(3, 4);                 // 4
arr;                            // [1, 2, 3, 4]

[1, 2, 3].includes(3);          // true
[1, 2, 3].includes(4);          // false

[1, 2, 3].indexOf(3);           // 2
[1, 2, 3].indexOf(4);           // -1
```

Iteration Methods
-------------------

```javascript
[1, 2, 3, 4].filter(function(item) {
  if (item % 2 === 0) {
    return true;
  }
});                                    // [2, 4]

// Iterate through each element and return the elements for which the callback function returns true

[1, 2, 3, 4].find(function(item) {
  if (item % 2 === 0) {
    return true;
  }
});                                     // 2

// Iterate through each element and return the first element for which the callback function returns true

[1, 2, 3, 4].findIndex(function(item) {
  if (item % 2 === 0) {
    return true;
  }
});                                     // 1

// Iterate through each element and return the index of the first element for which the callback function returns true

[1, 2, 3, 4].map(function(item) {
  if (item % 2 === 0) {
    return true;
  }
});                                    // [undefined, true, undefined, true]

// Iterate through each element and return the return value of the callback function

[1, 2, 3, 4].every(function(item) {
  if (item % 2 === 0) {
    return true;
  }
});                                         // false

// Iterate through each element and return true if the callback function returns true for every element. Otherwise, return false.

[1, 2, 3, 4].some(function(item) {
  if (item % 2 === 0) {
    return true;
  }
});                                         // false

// Iterate through each element and return true once the callback function returns true for an element. Otherwise, return false.
```               


Common Object Methods
---------------------

```javascript
obj = {
  firstName: 'Nitin',
  lastName: 'Savant',
};

obj['firstName'];           // 'Nitin'
obj.firstName;              // 'Nitin'

Object.keys(obj);           // ['firstName', 'lastName']

Object.values(obj);         // ['Nitin', 'Savant']
```
