require 'minitest/autorun'

class ValidPalindrome
  def palindrome?(string)
    normalized = string.downcase.gsub(/[^a-z0-9]/, '')
    normalized.reverse == normalized
  end

  def two_pointer_palindrome?(string)
    left = 0
    right = string.size - 1

    while left < right
      case
      when !string[left].match?(/[a-zA-Z0-9]/)
        left += 1
      when !string[right].match?(/[a-zA-Z0-9]/)
        right -= 1
      else
        return false if string[left].downcase != string[right].downcase

        left += 1
        right -= 1
      end
    end

    true
  end
end

class TestValidPalindrome < Minitest::Test
  def test_palindrome?
    valid_palindrome = ValidPalindrome.new

    assert_equal true, valid_palindrome.palindrome?('A man, a plan, a canal: Panama')
    assert_equal true, valid_palindrome.palindrome?('99oVo 99:----   ')
    assert_equal false, valid_palindrome.palindrome?('race a car')
    assert_equal true, valid_palindrome.palindrome?(' ')
  end

  def test_two_pointer_palindrome?
    valid_palindrome = ValidPalindrome.new

    assert_equal true, valid_palindrome.two_pointer_palindrome?('A man, a plan, a canal: Panama')
    assert_equal true, valid_palindrome.two_pointer_palindrome?('99oVo 99:')
    assert_equal false, valid_palindrome.two_pointer_palindrome?('race a car')
    assert_equal true, valid_palindrome.two_pointer_palindrome?(' ')
  end
end
