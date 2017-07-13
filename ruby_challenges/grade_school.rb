class School
  def initialize
    @roster = {}
  end

  def to_h
    @roster.sort.to_h
  end

  def add(name, grade)
    @roster[grade] = [] unless @roster[grade]
    @roster[grade] << name
    @roster.each { |_, names| names.sort! }
  end

  def grade(number)
    @roster[number] || []
  end
end

=begin
Write a program that stores student along with their grade level.
Actions:
- Add student to the roster
- List all students in a particular grade
- List all students alphabetically sorted first by grade number



=end
