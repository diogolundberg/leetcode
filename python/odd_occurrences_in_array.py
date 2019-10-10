def solution(A):
    count = dict()
    for number in A:
        occurrences = count.get(number, 0)
        count[number] = occurrences + 1
    return [key for key, value in count.items() if value % 2 > 0][0]
