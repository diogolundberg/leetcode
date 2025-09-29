def solution(A: list[int]) -> int:
    count: dict[int, int] = {}
    for number in A:
        occurrences: int = count.get(number, 0)
        count[number] = occurrences + 1
    for key, value in count.items():
        if value % 2 == 1:
            return key
    raise ValueError("No element with odd occurrences found")
