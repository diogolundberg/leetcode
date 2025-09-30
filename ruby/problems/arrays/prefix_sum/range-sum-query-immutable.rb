require "minitest/autorun"

=begin
Given an integer array nums, handle multiple queries of the following types:
1. Update the value of an element in nums.
2. Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.

Implement the NumArray class:
- NumArray(int[] nums) Initializes the object with the integer array nums.
- void update(int index, int val) Updates the value of nums[index] to be val.
- int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).


Example 1:
Input
  ["NumArray", "sumRange", "update", "sumRange"]
  [[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]
Output
  [null, 9, null, 8]

Explanation
  NumArray numArray = new NumArray([1, 3, 5]);
  numArray.sumRange(0, 2); // return 1 + 3 + 5 = 9
  numArray.update(1, 2);   // nums = [1, 2, 5]
  numArray.sumRange(0, 2); // return 1 + 2 + 5 = 8


Constraints:
- 1 <= nums.length <= 3 * 104
- -100 <= nums[i] <= 100
- 0 <= index < nums.length
- -100 <= val <= 100
- 0 <= left <= right < nums.length
- At most 3 * 104 calls will be made to update and sumRange.
=end

class NumArray

=begin
    :type nums: Integer[]
=end
    def initialize(nums)

    end


=begin
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def update(index, val)

    end


=begin
    :type left: Integer
    :type right: Integer
    :rtype: Integer
=end
    def sum_range(left, right)

    end


end

class TestNumArray < Minitest::Test
  def test_example
    num_array = NumArray.new([1, 3, 5])
    assert_equal 9, num_array.sum_range(0, 2)

    num_array.update(1, 2)
    assert_equal 8, num_array.sum_range(0, 2)
  end
end
# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# obj.update(index, val)
# param_2 = obj.sum_range(left, right)
