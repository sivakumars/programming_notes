109 Study Guide
=================

Notes created while preparing for Assessment 109. This assessment is designed to test knowledge of courses 100 and 101, which broadly covers the Ruby programming language, stopping short of Object Oriented Programming.

Local Variable Scope
--------------------
A variable's scope is defined by where the variable was initialized and determines where in a program the variable is available for use. A block — a piece of code following a method invocation — creates new scope. Examples: `loop`, `while`, `until`, `times`, `each`, `map`, `collect`, `select`, `detect`.

A variable initialized in an outer scope **can** be accessed in an inner scope.

```ruby
last_name = "savant"

loop do
  full_name = "nitin " + last_name # accesses variable from outer scope
  break
end
```

But a variable initialized inside a block **cannot** be accessed outside that block.

```ruby
loop do
  first_name = "nitin"
  break
end

full_name = first_name + " savant" # => Name Error: undefined local variable `first_name'
```

Control expressions **do not** create new scope. Examples: `if/elsif/else`, `case/when`, `unless`, `while`, `until`, `for`.

```ruby
for i in (1...2) do
  first_name = "nitin" # initializes variable
end

puts first_name # => 'nitin' (accessible outside of expression)
```

If a variable is reassigned by inner scope, the reassignment is reflected in outer scope — where that variable was initialized.

```ruby
last_name = "halgekar"

loop do
  last_name = "savant" # re-assigns outer scope variable
  break
end

puts last_name # => "savant"
```

Methods create their own scope entirely outside of the execution flow.

```ruby
last_name = "halgekar"

def rename(last_name)
  last_name = "savant" # reassigns new last_name variable with no effect on outer scope variable
end

rename(last_name)
puts last_name # => "halgekar"
```

Methods **cannot** directly access variables initialized outside the method.

```ruby
first_name = "nitin"

def rename
  full_name = first_name + " savant" # => NameError: undefined local variable `first_name'
end
```

Methods **can** access objects passed as arguments.

```ruby
first_name = "nitin"

def rename(name)
  full_name = name + " savant"
end

renamed = rename(first_name)
puts renamed # => "nitin savant"
```

Variables as Pointers
---------------------

A variable is a pointer to a space in memory, acting as a label for the space. When a variable is **reassigned**, it's pointed to a different memory space and **does not** affect any other variables that were pointed to its prior memory space.

```ruby
string = "hello"
another_string = string
string += " goodbye" # reassigns/points string to a new space in memory
puts another_string # => "hello"
```

When a destructive action is performed on a variable, the action changes the actual value of the space in memory, thereby affecting any other variables pointing to that space. This is known as *mutating the caller*.

```ruby
string = "hello"
another_string = string
string << " goodbye" # changes actual value in the memory space where string & another_string are pointed
puts another_string # => "hello goodbye"
```

When a variable is passed as an argument, the method initializes a new variable that points to the same memory space as the argument.

If a destructive action is performed on the new variable, the value of the space in memory is changed, thereby affecting the argument variable and any other variables pointing to that space in memory.

If that new variable is first reassigned within the method, the reassignment points it to a new space in memory and won't affect the argument variable. Any subsequent actions, destructive or not, do not affect the argument variable.

```ruby
num = [1]

def append_by_reassignment(input)
  input += [1] # reassignment points input to a new space in memory
end

def append_by_concatenation(input)
  input << 1 # destructive action changes the value in memory (i.e. mutates the caller)
end

append_by_reassignment(num)  # => [1, 1]
num                          # => [1]
append_by_concatenation(num) # => [1, 1]
num                          # => [1, 1]
```

Implicit Return of Blocks & Methods
------------------------------------

Methods always implicitly return the evaluated result of the last line of the expression unless an explicit return comes before it. At this point, execution of the method is stopped and any code after the `return` is ignored.

```ruby
def last_line
  "first line"
  "second line"
  "third line"
end

puts last_line # => "third line"

def returned_line
  "first line"
  return "second line"
  "third line"
end

puts returned_line # => "second line"
```

Pass by Reference vs. Pass by Value
-----------------------------------

Since re-assigning an object within a method **does not** affect the object's value outside the method, Ruby is considered by some to be  *pass by value*.

```ruby
name = "nitin"

def rename(name)
  name = "niteen"
end

rename(name)
puts name # => "nitin"
```

Since certain destructive methods **do** affect an object's value outside the method, Ruby isn't purely *pass by value*. In these cases, Ruby behaves as a *pass by reference* language.

```ruby
name = "nitin"

def rename(name)
  name.upcase!
end

rename(name)
puts name # => "NITIN"
```

Whether Ruby acts as **pass by value** or **pass by reference** depends on the operation. Some call this **pass by reference of the value**.

Puts vs. Return
---------------

Almost everything written in Ruby is an expression, and Ruby expressions always return a value.

```ruby
num = 2 # => 2
num + 1 # => 3
```

Expressions have two effects: they **do** something and they **return** something. The value returned is not necessarily the action that was performed.

```ruby
name = "nitin" # => assigns name to "nitin" AND returns "nitin"
puts name # => prints "nitin" AND returns nil
```

In addition to `puts`, the value of expressions can be printed using `print` and `p`. They all return `nil`.

```ruby
array = [1, 2, 3]

puts array # calls "to_s" on each array element, prints each element with a newline, and returns nil
1
2
3
=> nil

p array # prints array.inspect, prints a newline, and returns nil
[1, 2, 3]
=> nil

print array # call "to_s" on the array, prints the array, and returns nil
[1, 2, 3]=> nil
```

Common String Methods
--------------------

An string is a list of characters in a specific sequence.

```ruby
"hello" * 3 # => "hellohellohello"

"hello" + "world" # => "helloworld"

"hello" << "world" # => "helloworld"

"world".prepend("hello") # => "helloworld"

"helloworld"[4] # => "o"

"helloworld"[4,5] # => "oworl"

"helloworld"[4..6] # => "owo"

"helloworld"["ll"] # => "ll"

"hello".include?("ll") => true

"helloworld" =~ /o/ # => 4

"helloworld" =~ /a/ # => nil

/o/.match("helloworld") # => #<MatchData "o">

/a/.match("helloworld") # => nil

"hello".gsub("llo", "ckle") # => "heckle"

"hello".gsub(/[aeiou]/, "*") # => "h*ll*"

"hello".sub(/[aeiou]/, '*') # => "h*llo"

"hello".delete("l") # => "heo"

"hello".chars # => ["h", "e", "l", "l", "o"]

"hello".split("") # => ["h", "e", "l", "l", "o"]

"hello world".split # => ["hello", "world"]

"hello".reverse # => "olleh"

"stars".center(15) # => "     stars     "

"stars".center(15, '*') # => "*****stars*****"

"stars".rjust(15, '*') # => "**********stars"

"hellow".chop # => "hello"

"whaaaat".chr # => "w"
```

Common Array Methods
--------------------

An array is an ordered list of elements that can be of any type.

```ruby
array = ["h", "e", "l", "l", "o"]
array[1..3] # => ["e", "l", "l""]
array[1...3] # => ["e", "l"]
array[2, 2] # => ["l", "l"]
array.count # => 5
array.count("l") # => 2
array.join # => "hello"

[1, 2, 3] & [2, 3, 4] # => [2, 3]

[1, 2, 3] | [2, 3, 4] # => [1, 2, 3, 4]

[1, 2, 3] + [4, 5, 6] # => [1, 2, 3, 4, 5, 6]

[1, 2, 3] << 4 << 5 << 6 # => [1, 2, 3, 4, 5, 6]

[1, 1, 2, 2, 3, 3, 4, 5] - [1, 2, 4] # => [3, 3, 5]]

[1, 2, 3, 4, 5].find_index(3) # => 2

[1, 2, 3].include?(2) # => true

array = [1, 2, 3]
array.first # => 1
array # => [1, 2, 3]

array = [1, 2, 3]
array.take(2) # => [1, 2]
array # => [1, 2, 3]

array = [1, 2, 3]
array.drop(2) # => [3]
array # => [1, 2, 3]

array = [1, 2, 3]
array.last # => 3
array # => [1, 2, 3]

array = [1, 2, 3]
array.pop # => 3
array # => [1, 2]

array = [1, 2, 3]
array.push(3) # => 3
array # => [1, 2, 3, 3]

array = [1, 2, 3]
array.shift # => 1
array # => [2, 3]

array = [1, 2, 3]
array.unshift(1) # => [1, 1, 2, 3]
array # => [1, 1, 2, 3]

array = [1, 2, 3, 3, 5]
array.delete(3) # => 3
array # => [1, 2, 5]

array = ["bob", "joe", "ajay", "juan"]
array.delete_at(3) # => "juan"
array # => ["bob", "joe", "ajay"]
```

Common Hash Methods
--------------------

A hash stores elements by associated keys, resulting in a list of key-value pairs.

```ruby
hash = { name: "nitin", age: 30, employed?: false }
hash.keys # => [:name, :age, :employed?]
hash.values # => ["nitin", 30, false]
hash[:name] # => "nitin"
hash[:hometown]# => nil
hash.key("nitin") # => :name
hash.has_value?("nitin") # => true
hash.has_key?(:employed?) # => true
hash.size # => 3
hash.to_a # => [[:name, "nitin"], [:age, 30], [:employed?, false]]

hash = { name: "nitin", age: 30, employed?: false }
hash.delete(:age) # => 30
hash # => {:name=>"nitin", :employed?=>false}
hash[:age] = 31 # => 31
hash # => {:name=>"nitin", :employed?=>false, :age=>31}

hash = { name: "nitin", age: 30, employed?: false }
hash.shift # => [:name, "nitin"]
hash # => {:age=>30, :employed?=>false}
```

Collection Methods
-------------------

Collections — String, Hash, Array, Range, Set — are a way to store lists of data. Many collection methods allow you to iterate through them — execute a given block once for each element in the collection. These methods are provided by the Enumerable module that's *mixed in* to the Ruby classes above. If no block is passed to an Enumerable method, the Enumerator object is returned, which is what allows for method chaining.

`each` executes a given block once for each element and returns the collection.

```ruby
string = "launchschool"
string.each_char {|char| puts char } # outputs each character on separate lines and returns string

string = "launchschool"
string.chars.each {|char| puts char } # outputs each character on separate lines and returns an array of characters

string = "launch school"
string.split.each { |word| puts word } # outputs each word on separate lines and returns an array of words

[1, 2, 3].each { |element| puts element } # outputs each element on separate lines and returns array

hash = { name: "nitin", age: 30, employed?: false }
hash.each { |key, value| puts "#{key} #{value}" } # outputs each key/value pair on separate lines and returns hash
```

`select` evaluates a block once for each element and returns a new collection containing only the elements whose block's return value evaluates to `true`. `reject` is the opposite of select.

```ruby
[1, 2, 3].select {|element| element > 1 } # => [2, 3]
[1, 2, 3].reject {|element| element > 1 } # => [1]

hash = { name: "nitin", age: 30, employed?: false }
hash.select { |key, value| value } # => {:name=>"nitin", :age=>30}
hash.reject { |key, value| value } # => {:employed?=>false}
```

`map` executes a block once for each element and returns a new collection containing the block's return values. The `collect` method is an alias to `map` — they do the same thing.

```ruby
[1, 2, 3].map { |element| element*2 } # => [2, 4, 6]

hash = { nitin: 30, bob: 35, carlos: 40 }
hash.map { |key, value| value + 5 } # => [35, 40, 45]
```

`reduce` iterates through each element and passes the result of each iteration as an argument to the next iteration. Unless specified, result is `0` for the first iteration. After the final iteration, the final value of `result` is returned. `inject` is an alias to `reduce` — they do the same thing.

```ruby
[1, 2, 3, 4, 5].reduce { |result, element| result + element } # => 15
[1, 2, 3, 4, 5].reduce(:+) # => 15
[1, 2, 3, 4, 5].reduce(5, :+) # => 20
```

There are various other methods available to collections.

```ruby
[1, 2, 3, 4, 5].detect { |number| number > 2 } # => 3

[1, 2, 3, 4, 5].sort { |num1, num2| num2 <=> num1 } # => [5, 4, 3, 2, 1]

["nitin", "bob", "carlos"].sort_by { |word| word.length } # => ["bob", "nitin", "carlos"]

[1, 2, 3, 4, 5].any? { |num| num > 5 } # => false

[1, 2, 3, 4, 5].all? { |num| num > 0 } # => true

[1, 2, 3, 4, 5].none? { |num| num > 5 } # => true

[1, 2, 3, 4, 5].one? { |num| num > 4 } # => true

[1, 2, 3, 4, 5].max # => 5

[1, 2, 3, 4, 5].min # => 1

[1, 2, 3].zip([4, 5, 6]) #=> [[1, 4], [2, 5], [3, 6]]

```
