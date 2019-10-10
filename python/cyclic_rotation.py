def solution(A, K):
    if len(A) == 0:
        return A
    shift = K % len(A)
    return A[-shift:] + A[:-shift]
