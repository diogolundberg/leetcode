require 'minitest/autorun'

class SubArraySumEqualsK
  def subarray_sum_brute_force(nums, k)
    total = 0
    nums.each_with_index do |a, i|
      total_subarray = a
      total += 1 if a == k

      ((i + 1)...nums.size).each do |j|
        total_subarray += nums[j]
        total += 1 if total_subarray == k
      end
    end
    total
  end

  def subarray_sum_efficient(nums, k)
    iteration_sum = 0
    subarray_sums = Hash.new(0)
    subarray_sums[0] = 1
    total = 0

    nums.each do |num|
      iteration_sum += num
      total += subarray_sums[iteration_sum - k]
      subarray_sums[iteration_sum] += 1
    end
    total
  end
end

class TestSubArraySumEqualsK < Minitest::Test
  CASES = [
    { name: :nothing,    nums: [1, 1, 1], k: 0,                 expected: 0 },
    { name: :basic,      nums: [1, 1, 1], k: 2,                 expected: 2 },
    { name: :negatives,  nums: [1, 2, 3, -2, 5], k: 6,          expected: 2 },
    { name: :zeroes,     nums: [0, 0, 0], k: 0,                 expected: 6 },
    { name: :mixed,      nums: [3, 4, 7, 2, -3, 1, 4, 2], k: 7, expected: 4 }
  ]

  CASES.each do |c|
    define_method("test_brute_force_#{c[:name]}") do
      impl = SubArraySumEqualsK.new
      assert_equal c[:expected], impl.subarray_sum_brute_force(c[:nums], c[:k])
    end

    define_method("test_efficient_#{c[:name]}") do
      impl = SubArraySumEqualsK.new
      assert_equal c[:expected], impl.subarray_sum_efficient(c[:nums], c[:k])
    end
  end
end
