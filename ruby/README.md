# Ruby LeetCode Practice

This repository is for practicing **LeetCode problems in Ruby**, with tests and idiomatic Ruby solutions.

---

## 🗂 Problem Buckets (Patterns)

Solving by **patterns** helps you generalize and cover most LeetCode questions.

### 1. Arrays & Strings

- Prefix sum
- Two pointers
- Sorting-based
- Basic string manipulation
  📌 Examples:
- Two Sum
- Valid Anagram
- Container With Most Water

### 2. Hashing & Sets

- Frequency maps (`Hash.new(0)`, `tally`)
- Deduplication with `Set`
- Grouping data
  📌 Examples:
- Group Anagrams
- Longest Consecutive Sequence
- First Unique Character

### 3. Binary Search

- Search in sorted array
- Search leftmost/rightmost index
- "Answer in search space" problems
  📌 Examples:
- Search Insert Position
- Binary Search
- Median of Two Sorted Arrays

### 4. Sliding Window

- Fixed-size window
- Expanding/shrinking window
- Tracking unique elements in a window
  📌 Examples:
- Longest Substring Without Repeating Characters
- Minimum Window Substring
- Maximum Subarray

### 5. Recursion & Backtracking

- DFS on trees/graphs
- Subsets & permutations
- Divide and conquer
  📌 Examples:
- Subsets
- Generate Parentheses
- Word Search

### 6. Dynamic Programming (DP)

- 1D DP (climbing stairs, house robber)
- 2D DP (unique paths, edit distance)
- Knapsack-type
  📌 Examples:
- Climbing Stairs
- Coin Change
- Longest Increasing Subsequence

### 7. Graphs

- BFS / DFS
- Topological sort
- Union-Find (disjoint sets)
  📌 Examples:
- Number of Islands
- Clone Graph
- Course Schedule

### 8. Greedy

- Interval scheduling
- Heap-based greedy
  📌 Examples:
- Merge Intervals
- Jump Game
- Gas Station

---

## 🌐 Practice Resources

- [LeetCode Explore Cards](https://leetcode.com/explore/) → has problem sets grouped by pattern.
- [NeetCode.io](https://neetcode.io/) → excellent categorized roadmap.
- [AlgoMonster](https://algo.monster/) → paid but very structured by pattern.
- [Exercism Ruby Track](https://exercism.org/tracks/ruby) → good for Ruby idioms.
- [Codewars Ruby](https://www.codewars.com/collections/ruby) → Ruby-style small challenges.
- [LeetCode Problems (filter by Ruby)](https://leetcode.com/problemset/all/?language=Ruby) — main platform.

---

## 📚 Study Guides

- [Official Ruby Docs](https://ruby-doc.org/core/)
- [Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
- [RubyMonk](https://rubymonk.com/) (interactive Ruby practice)

---

## 🎥 Videos

- [NeetCode YouTube](https://www.youtube.com/@NeetCode) — clear walkthroughs of each problem pattern.
- [CS Dojo YouTube](https://www.youtube.com/@CSDojo) — beginner-friendly algorithm explanations.

---

## 🛠 Workflow

1. Pick a problem from a bucket.
2. Implement in `problems/<bucket>/<problem>.rb`.
3. Add tests in `test/<bucket>/test_<problem>.rb`.
4. Run with:
   ```bash
   ruby -Itest test/<bucket>/test_<problem>.rb
   ```
