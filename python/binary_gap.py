def solution(N):
    binary_str = str(bin(N))[2:]
    gaps = binary_str.strip('0').split('1')
    longest_gap = max(gaps, key=len)
    return len(longest_gap)
