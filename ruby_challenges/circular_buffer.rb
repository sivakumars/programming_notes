class CircularBuffer
  def initialize(buffer_length)
    @buffer_length = buffer_length
    clear
  end

  def clear
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write!(input)
    return unless input
    @buffer.shift if buffer_full?
    @buffer.push(input)
  end

  def write(input)
    return unless input
    raise BufferFullException if buffer_full?
    @buffer.push(input)
  end

  private

  def buffer_full?
    @buffer.size == @buffer_length
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end

=begin
5 actions: initialize, read, write, write!, clear

Initialize/Clear -- create buffer
Input: positive integer (buffer_length)
Output: some data structure that can store objects
Steps:
- Create empty data structure of buffer_length

Read -- remove and return oldest object in buffer
Input: none
Output: oldest object in buffer
Steps:
- Find oldest value in buffer
- Remove it from buffer
- Replace with empty value
- Return it

Write -- add new object to buffer
Input: object
Output: buffer with new object in oldest empty position
Steps:
- if buffer is full, raise error
- Find oldest empty position in buffer and replce with new object

Write! -- remove oldest object in buffer and replace with new object
Input: object
Output: buffer with new object in oldest empty position
Steps:
- if buffer is full
  - remove oldest object in buffer
  - add new object in its place
- else
  - call write method

Update -- update values for oldest value in buffer and oldest empty position
Input: what method called it?
Output: updated oldest data value

=end
