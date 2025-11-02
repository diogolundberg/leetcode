require 'minitest/autorun'

class NumArray
  def initialize(nums)
    @nums = nums
    @prefix_sum = Array.new(nums.length + 1, 0)

    (0...nums.length).each do |i|
      @prefix_sum[i + 1] = @prefix_sum[i] + nums[i]
    end
  end

  def sum_range(left, right)
    @prefix_sum[right + 1] - @prefix_sum[left]
  end
end

class TestNumArray < Minitest::Test
  def test_example
    num_array = NumArray.new([-2, 0, 3, -5, 2, -1])

    assert_equal 1, num_array.sum_range(0, 2)
    assert_equal(-1, num_array.sum_range(2, 5))
    assert_equal(-3, num_array.sum_range(0, 5))
  end
end
