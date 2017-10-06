249 Study Guide
=================

Notes created while preparing for Assessment 219. This assessment is designed to test knowledge of course 220 and will focus on Front End Development with JavaScript.

Introduction
------------

Functions vs. Methods
----------------------

In JavaScript, objects store a list of properties as *name-value* pairs. The property name can be any valid string and the property value can be any valid expression. When a property value contains a **function**, the property is called a **method**. To call a method, a calling object must be explicitly specified; this is known as **method invocation**.

```javascript
var greeter = {
  morning: function() {
    console.log('Good morning!');
  }
};

greeter.morning();        // Logs "Good morning!"
```

When a function is defined outside of an object, it can be directly called without explicitly specifying a calling object; this is known as **function invocation**.

```javascript
function morning() {
  console.log('Good morning!');
}

morning();                // Logs "Good morning!"
```

Object Factories
----------------

An Object is often used as a container to group related data and behavior; this pattern of using objects is called **object-oriented programming**. The benefits become evident when an application uses more than one instance of a given Object.

```javascript
function makeCar(rate) {
  return {
    speed: 0,
    rate: rate,
    accelerate: function() {
      this.speed += this.rate;
    }
  }
}

var hatchback = makeCar(9);
var corvette = makeCar(15);
```

This approach allows the creation of multiple instances of an object using functions, and when used this way, these functions are known as **object factories**.


Function Contexts (i.e. What is `this`?)
-----------------------------------------

Every invoked function or method has a **context** automatically assigned at execution time. This execution context is provided as an object that can be accessed through the keyword `this`. Inside a function, the value of `this` depends on how the function is invoked.

The Global Object
------------------

JavaScript creates a **global object** when it starts executing code. The global object contains all of the built-in functions and values defined by the JavaScript specification and the environment in which it's running. In a browser, the global object is the `window` object.

```javascript
this === window;    // true
```

The global object is also where JavaScript stores any variable and function declarations, adding them to the global object as properties.

```javascript
var greeting = 'Hello';
console.log(window.greeting);   // logs "Hello"
```

When defining global variables or functions, these global variables **cannot** be deleted.

```javascript
var num = 3;
delete window.num;      // false
```

If however you assign a variable without using the `var` keyword, it **can** be deleted.

```javascript
num = 3;
delete window.num;      // true
```

Function Execution Context (Implicit)
----------------------------

When a function is invoked with a calling object, JavaScript assigns the calling object as the execution context.

```javascript
var foo = {
  bar: function() {
    return this;
  }
}

foo.bar() === foo;      // true
```

When a function is invoked without a calling object, JavaScript automatically assigns the global object as the calling object (and therefore the execution context).

```javascript
alert('Hello');          // alerts "Hello"
window.alert('Hello');   // also alerts "Hello"
```

Even when a function is initially defined as a method, it can be assigned a global execution context if it's invoked without a calling object.

```javascript
var foo = {
  bar: function() {
    return this;
  }
}

var baz = foo.bar;
baz() === foo;              // false
baz() === window;           // true
```

Function Execution Context (Explicit)
-----------------------------------

JavaScript provides the `call` and `apply` methods that can change a function's execution context. In other words, we can explicitly bind a function's execution context to an object when we execute the function.

```javascript
var a = 'my context is global';

var object = {
  a: 'my context is object',
};

function foo() {
  return this.a;
}

foo();                  // 'my context is global'
foo.call(object);       // 'my context is object'
```

The `call` method can also accept arguments listed one by one after the context object. The `apply` method is identical to `call` except that it accepts arguments with an array.

JavaScript also has a `bind` method that permanently binds an execution context to a function. Unlike `call` and `apply`, `bind` doesn't execute the function but returns a new function.

Closures
---------

A **closure** is the combination of a function and the lexical environment within which that function was declared. Some people define a **closure** as simply a characteristic of functions in JavaScript. The characteristic being that a JavaScript function retains references to everything that was in scope when the Function was defined.

The *value* of a reference can change after creating a closure. When the closure is invoked, it sees the current value of the reference even if the value was different when the closure was created.

```javascript
function makeAdder(x) {
  return function(y) {
    return x + y;
  };
}

var add5 = makeAdder(5);
var add10 = makeAdder(10);

add5(2);          // 7
add10(2);         // 12
```

In the above example, `makeAdder` is used as a function factory to create two new functions, `add5` and `add10`. Both functions are closures; they share the same function definition, but store different lexical environments. In `add5`, `x` is 5, but in `add10`, `x` is 10.

This is also an example of **partial function application**. Partial function application uses a function

Private Data
------------

A closure can be used to hold private data that only the closure can access.  In the example below, there is no way to access `count` from outside the function. Variables inside closures are available to the closure only, and never outside it.

```javascript
function makeCounter() {
  var count = 0;       // declare a new variable
  return function() {
    count += 1;        // references count from the outer scope
    console.log(count);
  }
}

var counter = makeCounter();
counter();              // 1
counter();              // 2
```

Objects and Closures
--------------------

In many of the examples up to this point, we've used the concept of closures to return a function that allows a user to perform actions with private data.

In order to create a more semantic user interface, we can instead return an object that can provide multiple functions (or methods) for the user to perform actions.

```javascript
function makeCounter() {
  var count = 0;

  return {
    increment: function() {
      count += 1;
      console.log(count);
    },
    decrement: function() {
      count -= 1;
      console.log(count);
    }
  }
}

var counter = makeCounter();
counter.increment();            // 1
counter.increment()             // 2
counter.decrement();            // 1
```

Creating closures in loops: A common mistake
---------------------------------------------

In the example below, the code attempts to repeatedly call an asynchronous function but with a different value of `i` each time. The code misbehaves and logs `5`, `5`, `5`, `5`, `5`. Why?

```javascript
for (var i = 0; i < 5; i++) {
  setTimeout(function() {
    console.log(i);
  }, i * 100);
}
```

The reason is that in JavaScript, asynchronous function calls are sent to a separate callback queue where they wait for any synchronous code to finish executing. Once the synchronous code finishes (i.e. the stack is clear), the callback queue is processed.

In this particular case, the loop finishes and the final value of `i` is 5. When the callback function within `setTimeout` is finally called, it has access to the lexical environment in which it was defined. Therefore, it has access to `i` which has a value of `5` at the end of the loop, and therefore it logs `5`. Furthermore, it logs 5 times since `setTimeout` was called 5 times.

How can we fix this common mistake?

```javascript
function makeLogger(text) {
  return function() {
    console.log(text);
  }
}

for (var i = 0; i < 5; i++) {
  var logger = makeLogger(i);
  setTimeout(logger, i * 100);
}
```

By creating another closure inside the callback function using the value of `i` at each iteration. In the example above, `i` is passed into the `makeLogger` function and another function is returned that has access to that value of `i`.

In other words, rather than the callbacks all sharing a single lexical environment, the `makeLogger` function creates a new lexical environment for each callback.

Garbage Collection
-------------------

In non garbage-collected languages, you must manage memory allocation and deallocation for every value you wish to store in a variable. You must first request a chunk of memory from the system and then release that memory back to the system when you no longer need it.

JavaScript, however, is a **garbage-collected** language; it automatically allocates memory for you and cleans up values and objects when your program no longer needs them. That is, when there are no variables, objects, or closures that maintain a reference to the object or value, JavaScript marks the memory as eligible for GC. As long as the object or value remains accessible though, JavaScript can't and won't garbage collect it.

When you create a closure, you store a reference call to all variables in the current lexical environment. As long as the closure exists, the values represented by those variables cannot be garbage collected.

```javascript
function sayHelloTo(name) {
  return function() {
    console.log("Hello, " + name);
  }
}

var hello = sayHelloTo('Nitin');
hello();
```

After the above code has run, the string value `"Nitin"` is still in memory and cannot be garbage collected. To allow `"Nitin"` to be garbage collected, we can dereference the closure by setting the variable `hello` to `null`.

```javascript
hello = null;
```
