# frozen_string_literal: true

require 'minitest/autorun'

# Given an integer array nums, handle multiple queries of the following type:
# 1. Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
#
# Implement the NumArray class:
# - NumArray(int[] nums) Initializes the object with the integer array nums.
# - int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
#
# Example 1:
# Input
#   ["NumArray", "sumRange", "sumRange", "sumRange"]
#   [[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
# Output
#   [null, 1, -1, -3]
#
# Explanation
#   NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
#   numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
#   numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
#   numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3
#
#
# Constraints:
# - 1 <= nums.length <= 10⁴
# - -10⁵ <= nums[i] <= 10⁵
# - 0 <= left <= right < nums.length
# - At most 10⁴ calls will be made to sumRange.

class NumArray
  #     :type nums: Integer[]
  def initialize(nums)
    @nums = nums

    # Build a cumulative sum array with one extra slot.
    # @prefix_sum[i] = sum of nums[0...i] (all elements before index i).
    #
    # Why +1 size?
    # This way, prefix_sum[0] = 0 (empty sum),
    # and prefix_sum[n] = sum of all nums (so right+1 is always safe).
    @prefix_sum = Array.new(nums.length + 1, 0)

    # Fill cumulative totals:
    # prefix_sum[i+1] = prefix_sum[i] + nums[i]
    # → "running balance": each new slot adds one more number.
    (0...nums.length).each do |i|
      @prefix_sum[i + 1] = @prefix_sum[i] + nums[i]
    end
  end

  #     :type left: Integer
  #     :type right: Integer
  #     :rtype: Integer
  def sum_range(left, right)
    # Math theory:
    # prefix_sum[right+1] = sum of nums[0..right]
    # prefix_sum[left]    = sum of nums[0..left-1]
    #
    # Subtraction cancels everything before "left":
    # (nums[0]..nums[right]) - (nums[0]..nums[left-1])
    # = nums[left]..nums[right]
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

# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# param_1 = obj.sum_range(left, right)
