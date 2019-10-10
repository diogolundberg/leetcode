def solution(A):
    result = 0
    for i in range(0, len(A)):
        result = result ^ A[i] ^ (i + 1)
    return result ^ (len(A) + 1)
