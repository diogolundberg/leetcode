require 'minitest/autorun'

class NumArray
  def initialize(nums)
    @nums = nums
  end

  def update(index, val)
    @nums[index] = val
    @nums
  end

  def sum_range(left, right)
    @nums[left..right].sum
  end
end

class TestNumArray < Minitest::Test
  def test_example
    num_array = NumArray.new([1, 3, 5])

    assert_equal 9, num_array.sum_range(0, 2)
    assert_equal [1, 2, 5], num_array.update(1, 2)
    assert_equal 8, num_array.sum_range(0, 2)
  end
end
