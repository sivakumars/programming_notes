Algorithms and Data Structures Study Guide
==========================================

Notes created while studying algorithms and data structures with Launch School. An **algorithm** is simply a particular procedure for solving a problem, and a **data structure** is a particular way of organizing data in a computer.

Big O
-----

N represents the size of the input. Big O notation measures the growth rate (in number of steps) of a particular algorithm. In other words, how an algorithm scales with the size of the input data.

More formally, Big O is a relative representation of the complexity of an algorithm.

Arrays
------

The **array** is simply a list of data elements. The **index** of an array is the number that identifies where a piece of data lives inside the array.

- **Read:** Reading refers to looking up a value at a particular index. Because a computer implements an array by allocating contiguous slots in memory and a computer can jump to a memory address in one step, reading from an array is an O(1) operation.
- **Search:** Searching refers looking to see if a particular value exists within the array, and if so, which index it's at. To search for a particular value linearly takes a maximum of N steps, or O(N).
- **Insert:** Insertion refers to adding a new value to an additional slot within the array. Insertion at the end of an array takes just one step, however, insertion anywhere else requires elements to be shifted in memory. Like linear search, linear insertion can take a maximum of N + 1 steps, or O(N).
- **Delete:** Deletion refers to removing one of the values from the array. Following a similar process to insertion, deletion can take a maximum of N steps, or O(N).

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
