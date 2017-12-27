Algorithms and Data Structures Study Guide
==========================================

Notes created while studying algorithms and data structures. An **algorithm** is simply a procedure (or list of specific steps) for solving a problem, and a **data structure** is a particular way of organizing data in a computer.

Big O
-----

**Big O** is a relative representation of the complexity of an algorithm. It's relative because it compares algorithms that solve the same problem. It's a representation because it reduces the comparison to a single variable, the size of the input. It measures the complexity, or the amount of resources (e.g. time/space) required by an algorithm. In other words, how an algorithm's use of resources (time/space) scales with the size of the input data.

The complexity is often specifically the time complexity (number of steps) or space complexity (number of instances of data structures) of an algorithm. Again, it's how these metrics change as the size of the input changes.

- **O(1)**: Constant Time — Can go straight to the answer regardless of input size
- **O(logN)**: Logarithmic Time - Every step cuts the problem space in half. Doubling the input size only increases the # steps by 1.
- **O(N)**: Linear Time — Must visit every element of the input to get the solution. And the processing of each element is constant time.
- **O(NlogN)**: Linearithmic Time - Must visit every element of the input and processing of each is logarithmic time.
- **O(N^2)**: Quadratic Time - Must visit every element and for each element, must visit every other element again.
- **O(N!)**: Factorial Time - "traveling salesman"
  
Arrays
------

The **array** is simply a list of data elements. The **index** of an array is the number that identifies where a piece of data resides inside the array.

- **Read:** Reading refers to looking up a value at a particular index. Because a computer implements an array by allocating contiguous slots in memory and a computer can jump to any memory address in one step, reading from an array is an O(1) operation.
- **Search:** Searching refers to determining if a particular value exists within the array, and if so, which index it's located at. To search for a particular value linearly takes a maximum of N steps, or O(N).
- **Insert:** Insertion refers to adding a new value to the array. Insertion at the end of an array takes just one step, however, insertion anywhere else requires the existing array elements to be shifted in memory. Similar to linear search, linear insertion takes a maximum of N (+ 1) steps, or O(N).
- **Delete:** Deletion refers to removing one of the values from the array. Similar to insertion, deletion takes a maximum of N steps, or O(N).

Common Mental Models for Pointer Based Solutions
------------------------------------------------

Binary Search
--------------

While searching an unsorted array is O(N), the situation changes dramatically if the array is sorted. By using an algorithm called **binary search** on a sorted list of elements, we can achieve O(logN) search efficiency. The reason is that, since the elements are sorted, we can choose a value at the midpoint of the array, test it, and then decide which half of the array to test further, effectively throwing out the other half of the array.  

*Interview Tip*: If you already have a linear O(N) solution, and you're asked if you can do better, it's most likely going to involve a binary search. Here's a code template you can use to solve binary search problems.

```ruby
def binary_search
  left = 0
  right = array.size - 1

  while left + 1 < right
    mid = left + (right - left) / 2

    if array[mid] == target # optional early return
      return mid
    elsif array[mid] > target
      left = mid
    else
      right = mid
    end
  end

  # while loop ends with left/right pointers adjacent to each other
  # last step is to figure out which is the result you want
  if array[left] == target

  end

  if array[right] == target

  end
end
```

Linked Lists
-------------

A **linked list** is a data structure that represents a list of items, just like an array. Under the hood, however, linked lists are implemented differently and can have different performance in varying situations.

Unlike arrays, linked lists do not consist of a bunch of contiguous memory cells in a row. Instead, they consist of a bunch of cells that are not next to each other; these cells are known as **nodes**. In addition to the data stored within the node, each node also stores the memory address of the next node in the linked list; this extra piece of data is known as a **link**.

For our code to work with a linked list, all it really needs to know is where in the memory the first node begins. A linked list can be implemented in Ruby using two classes.

```ruby
class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
  end
end

class LinkedList
  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end
end
```

- **Read:** Because a linked list only knows the location of its first node, reading is much slower than an array. In the worst case, it's O(N) as it takes N operations to find the last element in a list.
- **Search:** Like an unsorted array, a linked list must look through every possible element, and therefore it's O(N).
- **Insert/Delete:** At the beginning of a list, insertion/deletion is O(1). Inserting/deleting in the middle of a list is O(N) because a search must be performed first to locate a specific element.

One case where linked lists shine is examining a single list and deleting many elements from it. Since you're already searching through the entire list, the linked list deletion takes only one step, while an array deletion would take up to N steps for each deletion (to shift the remaining elements).

Doubly linked lists offer O(1) insertions/deletions at both the front and back of the list. Therefore, they are a great data structure for implementing a queue, where you can only insert at the back and delete from the front.
