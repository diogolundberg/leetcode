def solution(A):
    front = A[0]
    end = sum(A[1:])
    difference = abs(front - end)
    for i in range(1, len(A) - 1):
        front += A[i]
        end -= A[i]
        new_difference = abs(front - end)
        if new_difference < difference:
            difference = new_difference
    return abs(difference)
