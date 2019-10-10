def solution(A):
    result = 0
    for i in range(0, len(A)):
        result = result ^ A[i] ^ (i + 1)
    return 1 if result == 0 else 0
