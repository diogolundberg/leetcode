# sum of 2 digits numbers

def solution(A):
    result = 0
    for number in A:
        if len(str(abs(number))) == 2:
            result += number
    return result
