# def times(number)
#   (0..number-1).each do |n|
#     yield(n)
#   end
#   number
# end
#
# def times(number)
#   counter = 0
#   while counter < number do
#     yield(counter)
#     counter += 1
#   end
#   number
# end
#
# times(5) do |num|
#   puts num
# end

# def each(array)
#   index = 0
#   while index < array.size
#     yield(array[index])
#     index += 1
#   end
#   array
# end
#
# each([1,2,3]) { |element| puts element }

# def select(array)
#   index = 0
#   result = []
#
#   while index < array.size
#     current_element = array[index]
#     result << current_element if yield(current_element)
#     index += 1
#   end
#
#   result
# end
#
# array = [1, 2, 3, 4, 5]
# p select(array) { |num| num.odd? }
# p select(array) { |num| puts num }
# p select(array) { |num| num + 1 }

# def reduce(array, default=0)
#   result = default
#   array.each do |element|
#     result = yield(result, element)
#   end
#   result
# end
#
# array = [1, 2, 3, 4, 5]
#
# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of?(Todo)

    @todos << todo
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)

  rescue ArgumentError => error
    puts error.message
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete_at(index)
  end

  def to_s
    puts "---- #{title} -----"
    @todos.each do |todo|
      puts todo
    end
  end

  def to_a
    @todos
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list << todo if yield(todo)
    end
    list
  end

  def find_by_title(string)
    select do |todo|
      todo.title == string
    end.first
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(string)
    find_by_title(string).done! if find_by_title(string)
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
end

system 'clear'
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo2.done!

puts list

p list.mark_done("Buy milks")

puts list
