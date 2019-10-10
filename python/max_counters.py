def solution(N, A):
    counters = [0] * N
    max_counter = 0
    min_counter = 0
    for i in A:
        if i > N:
            min_counter = max_counter
        else:
            count = counters[i -1] if counters[i -1] >= min_counter else min_counter
            counters[i -1] = count + 1
            if max_counter < counters[i -1]:
                max_counter = counters[i -1]
    return list(map(lambda counter: counter if counter >= min_counter else min_counter, counters))
