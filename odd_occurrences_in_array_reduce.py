import functools

def solution(A):
    return functools.reduce(lambda a, b: a ^ b, A)
