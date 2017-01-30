require 'pry'

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(buffer_length)
    @buffer_length = buffer_length
    clear
  end

  def clear
    @buffer = Array.new(@buffer_length)
    @oldest_data_at = 0
  end

  def read
    raise BufferEmptyException if @buffer.all?(&:nil?)
    show = @buffer[@oldest_data_at]
    @buffer[@oldest_data_at] = nil
    update('read')
    show
  end

  def write!(input)
    return unless input
    if buffer_full?
      @buffer[@oldest_data_at] = nil
      write(input)
      update('write!')
    else
      write(input)
    end
  end

  def write(input)
    raise BufferFullException if buffer_full?
    write_index = @oldest_data_at
    loop do
      if @buffer[write_index].nil?
        @buffer[write_index] = input
        break
      end
      write_index == @buffer_length - 1 ? write_index = 0 : write_index += 1
    end
    update('write')
  end

  private

  def buffer_full?
    @buffer.none?(&:nil?)
  end

  def update(input)
    if input == 'read' || input == 'write!'
      @oldest_data_at == @buffer_length - 1 ? @oldest_data_at = 0 : @oldest_data_at += 1
    end
  end
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
