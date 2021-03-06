149 Study Guide
=================

Notes created while preparing for Assessment 149. This assessment is designed to test knowledge of courses 120 and 130 and will focus mainly on Object Oriented concepts, though all prior material is fair game.

Object-Oriented Programming
--------------------

Historically, a program had been viewed as a procedure that takes input data, processes it using step-by-step instructions, and provides output data. This is often referred to as procedural programming.

**Object Oriented Programming** (OOP) is a way of thinking that was created in response to the growing complexity of large programs. Programmers needed a way to change one piece of a program without adversely affecting another piece of it.

OOP addresses this by using containers to bundle related data and any common instructions performed with that data. The container is called an **object** and its attributes (related data) and behavior (common instructions) are defined in its **class**.

When defining an object in a class, we typically focus on two things: the object's *state* (or set of attributes) and the object's available *behavior*. In Ruby, state is implemented using *instance variables* and behavior is implemented using *methods*. Strings, Arrays, Hashes, and Integers are some of the Ruby language's built-in objects.

In Ruby, everything is an object.

Instantiation
-------------

The process of creating a new object is called **instantiation**. In the example below, an instance of the `Dog` class was created and stored in the variable `my_dog`.

```ruby
class Dog
end

my_dog = Dog.new
```

Let's modify the class by adding an `initialize` method. When defined, the `initialize` method is called each time an object is instantiated.  We refer to the `initialize` method as a *constructor* because it's called whenever we create a new object.

```ruby
class Dog
  def initialize
    puts "You created a new Dog!"
  end
end

my_dog = Dog.new # outputs "You created a new Dog!"
```

Instance Methods and Instance Variables
---------------------------------------

Instance methods define the behaviors available to an object. The `Dog` class has a `bark` method that can be called on any `Dog` object.

```ruby
class Dog
  def bark
    puts "Woof!"
  end
end

my_dog = Dog.new
my_dog.bark # outputs "Woof!"
```

Instance variables (`@`) track information about an object. The `Dog` class below has a `name` instance variable and two instance methods to assign (`set_name=`) and retrieve (`get_name`) the `name` of a `Dog` object.  

```ruby
class Dog
  def set_name=(name)
    @name = name
  end

  def get_name
    @name
  end
end

my_dog = Dog.new
your_dog = Dog.new
my_dog.set_name=("Fitz")
your_dog.set_name = "Freddy"
my_dog.get_name # => "Fitz"
your_dog.get_name # => "Freddy"
```

`my_dog` and `your_dog` are different objects and may contain different states, such as the value of the `name` variable. Since they are both instances of the `Dog` class, the same behaviors (or methods) are available to both. Note the different Ruby syntaxes available to call `set_name=`.

Accessor Methods (Getter/Setter)
--------------------------------

The two methods from the previous example are known as accessor methods.  More specifically, `set_name` is a `setter` method and `get_name` is a `getter` method. Because these methods are so common, Ruby has a built-in way to create them using the **attr_accessor** method. The example class below is practically equivalent to (and much shorter than) the previous example.

```ruby
class Dog
  attr_accessor :name
end

my_dog = Dog.new
my_dog.name = "Fitz"
my_dog.name # => "Fitz"
```

The `attr_acessor` method takes a symbol as an argument and uses i to name the `getter` and `setter` methods. To only create a `getter`, use `attr_reader` instead, and to only create a `setter`, use `attr_writer`.

Self
----

In the example below, `my_dog` is adopted by an owner, and the value of the `owner` variable should be updated. But something goes wrong!

```ruby
class Dog
  attr_accessor :name, :owner

  def initialize(name)
    @name = name
  end

  def adopted_by(name)
    owner = name
  end
end

my_dog = Dog.new("Fitz")
my_dog.adopted_by("Carlos")
my_dog.owner # => nil
```

The problem is that, in the `adopted_by` method, Ruby thinks we're trying to assign a value to a local variable, `owner`. Our expectation of Ruby's syntactical sugar has come into conflict with standard Ruby syntax. To clarify that we actually want to call the setter method, we must use the `self` keyword.

```ruby
class Dog
  attr_accessor :name, :owner

  def initialize(name)
    @name = name
  end

  def adopted_by(name)
    self.owner = name
  end
end

my_dog = Dog.new("Fitz")
my_dog.adopted_by("Carlos")
my_dog.owner # => "Carlos"
```

Calling `self` from an instance method in this manner returns a reference to the calling object. In the above example, `self.owner` is the essentially the same as `my_dog.owner`

Another use case of `self` is to define a **class method**, a method that can be called without having to create any objects of that class. Class methods are called on the class itself and contain functionality that doesn't pertain to individual objects.

```ruby
class Dog
  def self.what_am_i
    "I'm a Dog class."
  end
end

Dog.what_am_i # => "I'm a Dog class."
```

When `self` is called inside a class but outside an instance method, it refers to the class itself. For example, `def self.method` is essentially the same as `def Dog.method`. As demonstrated, `self` refers to different things depending on where it's used.

Inheritance
-----------

**Inheritance** is when a class inherits behavior from another class. In the example below, `Dog` inherits from `Animal` and gains access to all its methods. Therefore, `my_dog` is able to use the `speak` method from the `Animal` class. The class that inherits is called the subclass and the class it inherits from is its superclass.

```ruby
class Animal
  def speak
    puts "Hello!"
  end
end

class Dog < Animal
end

my_dog = Dog.new
my_dog.speak # outputs "Hello!"
```

In the example below, `Dog` overrides the `speak` method from  `Animal`. This is because Ruby first looks for a called method in an object's class before looking in its superclass. This ability for an object to change the behavior of a method from its parent class is called **polymorphism**. In other words, the same interface (i.e. method name) is provided for two different underlying forms (i.e. objects).

```ruby
class Animal
  def speak
    puts "Hello!"
  end
end

class Dog < Animal
  def speak
    puts "Woof!"
  end
end

my_dog = Dog.new
my_dog.speak # outputs "Woof!"
```

The `to_s` Method
---------------

Every Ruby object (and custom class) inherently subclasses from the `Object` class and therefore has access to all its methods.

```ruby
class Dog; end

my_dog = Dog.new
my_dog.to_s # => #<Dog:0x007fe510b859a0>
puts my_dog # outputs "#<Dog:0x007fe510b859a0>""
```

The `puts` method calls `to_s` on the calling object and outputs the result. It's generally recommended to **not** override any inherited `Object` methods. One exception is the `to_s` method.

```ruby
class Dog
  def initialize(name)
    @name = name
  end

  def to_s
    "I'm a dog, and my name is #{@name}."
  end
end

my_dog = Dog.new("Fitz")
my_dog.to_s # => "I'm a dog, and my name is Fitz."
puts my_dog # outputs "I'm a dog, and my name is Fitz."
```

super
------

Ruby provides a built-in function called `super` that allows us to directly call a method from an object's superclass. When called, `super` will search the inheritance hierarchy for a method of the same name and invoke it.

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class Dog < Animal
  def speak
    super + " Woof!"
  end
end

my_dog = Dog.new
my_dog.speak # => "Hello! Woof!"
```

A common way of using `super` is with `initialize`. In the example below, the `name` argument is passed to the `initialize` method of the superclass, which assigns its value to the `@name` instance variable. Although it was set by a method from the `Animal` class, the `@name` instance variable belongs to the `Dog` class and is accessible by its instance methods.

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name, color)
    super(name)
    @color = color
  end
end

my_dog = Dog.new("Fitz", "Brown") # => #<Dog:0x007f8068a71ee0 @name="Fitz", @color="Brown">
```

If `super` is called without any arguments, it automatically forwards the arguments that were passed to the method from which it was called. In the example below, the value of the `color` argument is passed to the `initialize` method in the `Animal` superclass and `@name` is also set to "Brown".

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(color)
    super
    @color = color
  end
end

my_dog = Dog.new("Brown") # => #<Dog:0x007feba4252690 @name="Brown", @color="Brown">
```

Mixing in Modules
-----------------

A module is another way to group related behaviors. But unlike a class, you cannot instantiate an object from a module. You also cannot subclass from a module. Modules are primarily used to "mix in" (or add) functionality to an existing class.  To make a module's methods available,  the `include` keyword is placed in the existing class definition. In the example below, `Dog` and `Human` are given access to the `speak` method from the `Noise` module.

```ruby
module Noise
  def speak
    "Hello!"
  end
end

class Dog
  include Noise
end

class Human
  include Noise
end

class Cat; end

my_dog = Dog.new
my_dog.speak # => "Hello!"
my_cat = Cat.new
my_cat.speak # => NoMethodError: undefined method `speak' for #<Cat:0x007f89818f5f90>
me = Human.new
me.speak # => "Hello!"
```

Modules may also simply act as a namespace, allowing you to group related classes together. This makes it easier to recognize related classes in code and reduces the chance that a class will conflict with another similarly named class.

Inheritance vs. Modules
------------------------

In Ruby, you can only inherit from one class but you can mix in any number of modules. The ability to mix in modules is Ruby's way of supporting the functionality of multiple inheritance while preserving a simple tree-like class hierarchy.

Inheritance is generally used for "is a" relationships, while modules are used for "has a" relationships. For example, a dog *is a* animal and a dog *has a* ability to make noise.  

Method Lookup Path
------------------

Ruby follows a distinct path to locate a called method. In the example below, after first looking in the calling object's class, the program next looks through the mixed in modules, and lastly in the object's superclass. When multiple modules are mixed in, Ruby looks at the last included module first and works up from there.

```ruby
class Animal
end

module Climbable
end

module Swimmable
end

class Dog < Animal
  include Swimmable
  include Climbable
end

p Dog.ancestors # => [Dog, Climbable, Swimmable, Animal, Object, Kernel, BasicObject]
```

Private, Protected, and Public
-------------------------------

**Public method** are accessible to anyone who knows the class's or object's name. They comprise a class's *interface*, or how other classes and objects can interact with the class and its objects.

```ruby
class Dog
  attr_accessor :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def dog_age
    age * 7
  end

  protected

  def dog_years_protected
    age * 7
  end

  private

  def dog_years_private
    age * 7
  end
end

my_dog = Dog.new("Fitz", 2)
my_dog.dog_age # => 14
my_dog.dog_years_protected # => NoMethodError: protected method `dog_years_protected' called...
my_dog.dog_years_private # => NoMethodError: private method `dog_years_private' called...
```

Unlike public methods, **private methods** and **protected methods** are accessible only from within other methods of that class. The difference is that a private method cannot be called using `self`.

```ruby
class Dog
  attr_accessor :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def dog_age
    dog_years_private
  end

  def dog_age_with_self
    self.dog_years_private
  end

  private

  def dog_years_private
    age * 7
  end
end

my_dog = Dog.new("Fitz", 2)
my_dog.dog_age # => 14
my_dog.dog_age_with_self # => NoMethodError: private method `dog_years_private' called...
```

If you change the above example from `private` to `protected`, the example succeeds in returning `14` twice. This restriction on private methods means that protected methods are used when `self` is needed. One example is when comparing sensitive (i.e. non-public) information between two objects.

Collaborator Objects
--------------------

A variable can hold any kind of object, even that of a custom class. In the example below, `@pet` is set to `my_dog`, a `Dog` object. So when `me.pet` is called, it returns a `Dog` object.

```ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Dog
  def initialize(name)
    @name = name
  end
end

me = Person.new("Nitin")
my_dog = Dog.new("Fitz")
me.pet = my_dog
me.pet # => #<Dog:0x007ff258b7a9d8 @name="Fitz">
```

Working with collaborator objects in your class is no different than working with strings, integers, arrays, or hashes.

Truthiness
----------

In Ruby, to express "nothing", `nil` is used, and `nil` evaluates to `false`. But while both `nil` and `false` both evaluate to `false`, they are not equivalent.

```ruby
false.class # => FalseClass
!!nil # => false
!!false # => false
nil == false # => false
```

Other than `false` and `nil`, Ruby considers everything to be "truthy". Any expression that evaluates to `true` is considered truthy.

```ruby
true.class # => TrueClass
!!true # => true
!!0 # => true
!!"" # => true
!!(num == 0) # => true
!!(num = 0) # => true
```

```ruby
num = 5
!!(num = 5) # => true
num == true # => false
!!num == !!true # => true

puts "Hello!" if num # outputs "Hello!"
```

Logical Operators
------------------

The `&&` and `||` operators exhibit a behavior called **short circuiting**, which means an expression will stop evaluating when the return value is guaranteed.

```ruby
false && 3/0 # => false
true || 3/0 # => true
```

```ruby
3/0 && false # => ZeroDivisionError: divided by 0
3/0 || true # => ZeroDivisionError: divided by 0
```

Even though `3/0` is invalid code and will raise a `ZeroDivisionError`, it doesn't in the first set of examples. The reason is that `3/0` is never actually evaluated because the return value is already guaranteed by the first expression in each example. When you reverse the order of the expressions, you'll now see the error.

Equivalence
-----------

When we test equality of two `String` objects using `String#==`, we are actually comparing values within the two objects, not the objects themselves. To check if two `String` objects are actually the same, we use the `Object#equal?` method.

```ruby
str1 = "nitin"
str2 = "nitin"

str1 == str2 # => true
str1.object_id # => 70284040814700
str2.object_id # => 70284040798520
str1.equal?(str2) # => false

str2 = str1

str1 == str2 # => true
str1.object_id # => 70284040814700
str2.object_id # => 70284040814700
str1.equal?(str2) # => true
```

The important thing to remember is that `==` is actually a method and it's defined in the `String` class, overriding the `BasicObject#==` method.

Since integers (and symbols) are **immutable**, they behave differently.

```ruby
num1 = 10
num2 = 10

num1 == num2 # => true
num1.object_id # => 21
num2.object_id # => 21
num1.equal?(num2) # => true
```

Fake Operators
--------------

Ruby aims to be concise and succinct. To meet this aim, the language contains a lot of "syntactical sugar", or special syntax that creates more readable code while hiding what's actually going on underneath. For example, when calling the method `String#==`, we call it with a special syntax that reads more naturally (eg. str1 == str2) than the more method-like option (eg. str1.==(str2)). A consequence of this syntactical sugar is that it's sometimes difficult to know if an operator is actually an operator or simply a method disguised as an operator.

#### Real Operators

| **Operator**                                  | **Description**               |
| ----------------                              | -------------                 |
| `&&`                                          | Logical "and"                 |
| <code>&#124;&#124;</code>                     | Logical "or"                  |
| `..`, `...`                                   | Inclusive and exclusive range |
| `? :`                                         | Ternary if-then-else          |
| `=`, `+=`, `-=`, `%=`, `*=`, `/=`, `%=`, `%=` | Assignment (and shortcuts)    |

#### Fake Operators

| **Method**              | **Description**                       |
| ----------------        | -------------                         |
| `[]`, `[]=`             | Collection getter/setter              |
| `**`                    | Exponential operator                  |
| `!`, `~`                | Not, complement                       |
| `+`, `-`, `%`, `*`, `/` | Plus, minus, modulo, multiply, divide |
| `<<`, `<<`              | Right and left shift                  |
| `<`, `<=`, `>`, `>=`    | Less than, greater than, or equal to  |
| '<=>', `==`, `!=`, `=~` | Equality and pattern matching         |


Because fake operators are actually methods, their functionality can be overridden in a custom class.

```ruby
class Dog
  attr_reader :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def ==(other_dog)
    age == other_dog.age
  end
end

my_dog = Dog.new("Fitz", 2)
your_dog = Dog.new("Freddy", 2)

my_dog.==(your_dog) # => true
my_dog == your_dog # => true
```

Let's examine the `[]` and `[]=` methods using the two equivalent groups of code below. Note the second example takes advantage of Ruby's special syntax and reads much more naturally.

```ruby
array = ["Fitz", "Freddy"]

array.[](1) # => "Freddy"
array.[]=(2, "Titan") # => "Titan"
array # => ["Fitz", "Freddy", "Titan"]
```

```ruby
array = ["Fitz", "Freddy"]

array[1] # => "Freddy"
array[2] = "Titan" # => "Titan"
array # => ["Fitz", "Freddy", "Titan"]
```

Instance Variable Scope
-----------------------

Instance variables begin with `@` and are scoped at the object level. Unlike local variables, they are accessible within any instance method, even if initialized in a different instance method.

```ruby
class Dog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end
end

my_dog = Dog.new("Fitz")
my_dog.get_name # => "Fitz"
```

Also unlike local variables, when accessing an instance variable that hasn't been initialized, `nil` is returned. An uninitialized local variable would raise a `NameError`.

```ruby
class Dog
  def get_name
    @name
  end
end

my_dog = Dog.new
my_dog.get_name # => nil
```

Instance variables initialized in a superclass are also accessible. In the example below, `Dog` subclasses `Animal`, so when a `Dog` object is instantiated, it looks for an `initialize` method. Since it can't find it within `Dog` it proceeds up the method lookup path, and locates an `initialize` method in `Animal` . The `@name` instance variable is initialized and belongs to the `Dog` object.

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def to_s
    "Woof! My name is #{@name}."
  end
end

my_dog = Dog.new("Fitz")
my_dog.to_s # => "Woof! My name is Fitz."
```

Class Variable Scope
-----------------------

Class variables begin with `@@` and are scoped at the class level. All objects share one copy of a class variable. Class methods can access class variables regardless of where they're initialized.

```ruby
class Dog
  @@total_dogs = 0

  def self.total_dogs
  @@total_dogs
  end

  def initialize
    @@total_dogs += 1
  end

  def total_dogs
    @@total_dogs
  end
end

Dog.total_dogs # => 0
my_dog = Dog.new
Dog.total_dogs # => 1
your_dog = Dog.new
Dog.total_dogs # => 2
my_dog.total_dogs # => 2
```

This is an example of using a class variable and a class method to keep track of a class-level detail that pertains only to the class, and not to any individual objects.

Note that it's possible for a class variable to adversely affect the value of the class variable in its superclass and therefore the superclass's other subclasses. For this reason, class variables are generally avoided, especially when working with inheritance.

Constant Scope
-----------------------

When creating classes there may also be certain variables that you never want to change. A constant variable (or simply a **constant**) begins with an uppercase letter and has lexical scope.

```ruby
class Dog
  LEGS = 4
end

class Human
  LEGS = 2

  def legs
    "I have #{LEGS} legs and a dog has #{Dog::LEGS} legs."
  end
end

me = Human.new
me.legs # => "I have 2 legs and my dog has 4 legs."
```
Unlike class or instance variables, a constant can be accessed across unconnected classes using the namespace resolution operator, `::`.  

When it comes to inheritance, constants behave as expected. A constant initialized in a superclass is inherited by the subclass, and can be accessed by both class and instance methods. With a mixed in module, however, you must specify which class defines the constant.

```ruby
module Legs
  def legs_without_namespace
    "I have #{LEGS} legs"
  end

  def legs
    "I have #{Dog::LEGS} legs"
  end
end

class Dog
  include Legs

  LEGS = 4
end

my_dog = Dog.new
my_dog.legs_without_namespace # => NameError: uninitialized constant Legs::LEGS
my_dog.legs # => "I have 4 legs."
```

Closures
--------

A closure is a concept that allows programmers to save a "chunk of code" and execute it later. In addition to storing code, a closure binds its surrounding variables, methods, and objects so they can be referenced when the closure is executed. In Ruby, a closure is implemented with either a block, `Proc`, or lambda.

### Blocks

A block is often passed in as an argument to a method call. In the example below, the block is the code between the `do ... end`.

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
# => [1, 3]
```

In Ruby, every method can take an optional block as an implicit parameter. It's up to the method implementation to decide what to do with the block of code given to it; many ignore it.

```ruby
puts("hello") { " goodbye!" } # outputs "hello"
```

If a method wants to use the block, the `yield` keyword returns the value of the block to the method.  

```ruby
def print_block(arg1)
  puts arg1 + yield
end

print_block("hello") { " goodbye!" } # outputs "hello goodbye!"

print_block("hello") # => LocalJumpError: no block given (yield)
```

If a block isn't provided, a `LocalJumpError` will be raised. To prevent this error, the `Kernel#block_given?` method can be used to handle times when a block isn't passed to the method.

```ruby
def print_block(arg1)
  puts(block_given? ? arg1 + yield : arg1)
end

print_block("hello") { " goodbye!" } # outputs "hello goodbye!"
print_block("hello") # outputs "hello"
```

When a block is called (or yielded to), it can be passed arguments of its own. In the example below, the value of `number + 1` is passed to the block and assigned to the block local variable `num`. This is a special type of local variable where the scope is constrained to the block.

```ruby
def increment(number)
  block_given? ? yield(number + 1) : (number + 1)
end

increment(5) do |num|
  num + 1
end # => 7

increment(5) # => 6
```

#### Main Use Cases for Blocks:

- Give *method caller* more power and flexibility when invoking your method. If you encounter a scenario where you're calling a method from multiple places, with one little tweak in each case, it may be a good idea to try implementing the method in a generic way by yielding to a block.

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
# => [1, 3]
```

- Allow *method caller* to do something before and after any specified action; the block's code being that action. There are many useful use cases for "sandwich code". Timing, logging, notification systems are all examples where before/after actions are important.

```ruby
File.open("some_file.txt", "w+") do |file|
  # write to this file using file.write
end
```

### Procs

A `Proc` allows you to save a block into a variable. A `Proc` object can then be passed directly into a method and also reused later in your program. A `Proc` is executed using the `Proc#call` method.

```ruby
a = Proc.new { "stored in proc"}

def increment(proc1)
  puts proc1.call
end

increment(a) # outputs "stored in proc"
```

Multiple `Proc` objects can be passed into a method, while just one block can be passed as an argument.

### Lambdas

```ruby
proc = Proc.new { "block"}
lam = lambda { "block" }

proc # => #<Proc:0x007fc6b7a8eed8@(irb):30>
lam # => #<Proc:0x007fc6b80a67a8@(irb):31 (lambda)>
```

A `lambda` is a special type of `Proc` object. There are a couple key differences though. The first is arity; a `lambda` enforces the number of arguments, while a `Proc` does not. The second difference is how they react to a `return`.

```ruby
def lambda_test
  lam = lambda { return }
  lam.call
  puts "Hello!"
end

def proc_test
  proc = Proc.new { return }
  proc.call
  puts "Hello!"
end

lambda_test # outputs "Hello!"
proc_test # outputs nothing
```

With a `lambda`, the `return` jumps back to the code immediately after the lambda was called. With a `Proc`, a `return` jumps all the way to outside the method where the `Proc` was called.

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "Hi #{name}!"}
name = "Bob"

call_me(chunk_of_code) # outputs "Hi Bob!"
```

The `Proc` keeps track of its surrounding context (e.g. `name` variable). In Ruby, this **binding** not only includes local variables, but also method references, constants and other artifacts in your code -- whatever it needs to execute correctly. It's why code like the above will work fine, seemingly violating method scoping rules.

Arity
-----

Calling a block is kind of like calling a method. Unlike a method though, blocks have lenient **arity**, or argument number enforcement.

A method requires the correct number of arguments be passed. A `lambda` also enforces the exact number of arguments. If the correct number of arguments is not passed, an error is raised.

But a `Proc` or a block dos not enforce the number of arguments passed. If a block argument is expected and no variable is passed, the block variable will be set to `nil`. If extra block arguments are passed, they are ignored.

Writing methods that take a block
-------------------------------------

```ruby
def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter])
    counter += 1
  end
  array
end

each([1, 2, 3]) do |num|
  p num
end # outputs each num on separate lines and returns [1, 2, 3]
```

```ruby
def select(array)
  counter = 0
  new_array = []
  while counter < array.size
    current_element = array[counter]
    new_array << current_element if yield(current_element)
    counter += 1
  end
  new_array
end

select([1, 2, 3]) do |num|
  num.odd?
end # => [1, 3]
```

```ruby
def map(array)
  counter = 0
  new_array = []
  while counter < array.size
    new_array << yield(array[counter])
    counter += 1
  end
  new_array
end

map([1, 2, 3]) do |num|
  num + 1
end # => [2, 3, 4]
```

```ruby
def reduce(array, default=0)
  counter = 0
  result = default
  while counter < array.size
    result = yield(result, array[counter])
    counter += 1
  end
  result
end

reduce([1, 2, 3]) do |acc, num|
  acc + num
end # => 6
```

```ruby
def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end
  number
end

times(3) do |num|
  puts num
end
```
