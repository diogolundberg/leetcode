def solution(X, Y, D):
    distance = Y - X
    extra =  1 if distance % D > 0 else 0
    return distance // D + extra
