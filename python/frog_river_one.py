def solution(X, A):
    path = set()
    for index, leaf in enumerate(A):
        path.add(leaf)
        if len(path) == X:
            return index
    return -1
