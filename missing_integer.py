def solution(A):
    occurences = dict()
    
    for i in A:
        if i > 0 and i not in occurences:
            occurences[i] = True

    for index in range(1, len(occurences.keys()) + 1):
        if index not in occurences:
            return index
        elif index == len(occurences):
            return index + 1

    return 1
