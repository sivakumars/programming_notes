## Exercise 1

system 'clear'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class ExerciseTest < MiniTest::Test

  def test_boolean_assertion
    value = 7
    assert_equal(true, value.odd?)
  end

  def test_equality_assertion
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end

  def test_nil_assertion
    value = nil
    assert_nil(value)
  end

  def test_empty_object_assertion
    list = []
    assert_empty(list)
  end

  def test_included_object_assertion
    list = [1, 2, 'xyz']
    assert_includes(list, 'xyz')
  end

  # def test_exception_assertion
  #   assert_raises NoExperienceError do
  #     employee.hire
  #   end
  # end

  def test_type_assertion
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_kind_assertion
    value = 1
    assert_kind_of(Numeric, value)
  end

  # def test_same_object_assertion
  #   assert_same(list, list.process)
  # end

  def test_refutations
    list = [1, 2, 'xyzz']
    refute_includes(list, 'xyz')
  end
end
