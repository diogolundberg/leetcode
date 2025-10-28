# Arrays & Strings

This bucket covers problems that use **array and string techniques**.
Each subsection has:

- **Concept**: the idea behind the technique.
- **Problems**: direct LeetCode links.
- **Ruby Hint**: idiomatic Ruby trick to help solve it.

---

## 🟦 Prefix Sum

**Concept**: Precompute cumulative sums so subarray queries are O(1). Useful for range queries and balance problems.

**Problems**

- [303. Range Sum Query - Immutable](https://leetcode.com/problems/range-sum-query-immutable/)
- [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)
- [724. Find Pivot Index](https://leetcode.com/problems/find-pivot-index/)

**Ruby Hint**

```ruby
prefix = [0]
nums.each { |n| prefix << prefix[-1] + n }
# sum of range [l, r] = prefix[r+1] - prefix[l]
```

## 🟩 Two Pointers

**Concept:** Use two indices (either at both ends or fast/slow) to scan arrays/strings efficiently.
This pattern often reduces O(n²) brute force to O(n).

**Problems**

- [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
- [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)
- [283. Move Zeroes](https://leetcode.com/problems/move-zeroes/)
- [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)

**Ruby Hint**

```ruby
l, r = 0, nums.length - 1
while l < r
  # compare/use nums[l], nums[r]
  # move l += 1 or r -= 1 based on condition
end
```

## 🟨 Sorting-based

**Concept:** Sort the input first, then solve with a linear sweep or greedy approach.
This is useful for grouping, interval merging, or constructing ordered results.

**Problems**

- [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)
- [179. Largest Number](https://leetcode.com/problems/largest-number/)
- [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

**Ruby Hint**

```ruby
# Group Anagrams
words.group_by { |w| w.chars.sort.join }.values

# Largest Number (sort by custom comparator)
nums.map(&:to_s).sort { |a, b| (b+a) <=> (a+b) }.join.sub(/^0+/, "0")

# Merge Intervals
intervals.sort_by!(&:first)
merged = []
intervals.each do |a, b|
  if merged.empty? || merged[-1][1] < a
    merged << [a, b]
  else
    merged[-1][1] = [merged[-1][1], b].max
  end
end
```

## 🟧 Basic String Manipulation

**Concept:** Lean on Ruby’s `String`/`Array` helpers like `chars`, `tally`, slicing, `join`, etc.
These let you solve problems concisely without manual loops.

**Problems**

- [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)
- [344. Reverse String](https://leetcode.com/problems/reverse-string/)
- [14. Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)

**Ruby Hint**

```ruby
# Valid Anagram
s.chars.tally == t.chars.tally

# Reverse String (in place, given array of chars)
left, right = 0, s.length - 1
while left < right
  s[left], s[right] = s[right], s[left]
  left  += 1
  right -= 1
end

# Longest Common Prefix
prefix = strs.min_by(&:length)
strs.each do |w|
  prefix = prefix[0...prefix.length] while !w.start_with?(prefix)
end
prefix
```

## 📌 Classic Must-Do Examples

These are fundamental problems that combine the techniques in this bucket and should be solved first.

**Problems**

- [1. Two Sum](https://leetcode.com/problems/two-sum/) → _Hash map / two pointers hybrid_
- [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/) → _String manipulation with `tally`_
- [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/) → _Two pointers_

**Ruby Hint**

```ruby
# Two Sum (hash map)
map = {}
nums.each_with_index do |n, i|
  return [map[target - n], i] if map.key?(target - n)
  map[n] = i
end

# Valid Anagram
s.chars.tally == t.chars.tally

# Container With Most Water
l, r = 0, height.length - 1
max_area = 0
while l < r
  max_area = [max_area, (r - l) * [height[l], height[r]].min].max
  if height[l] < height[r]
    l += 1
  else
    r -= 1
  end
end
max_area
```
