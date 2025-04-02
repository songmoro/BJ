# 8 2
# 1 2 3 4 5 6 7 8

N, K = map(int, input().split(" "))
A = list(map(lambda c: int(c) % 2 == 0, input().split(" ")))

s, e = 0, 0
answer = 0
current = 0

while s < N:
    while e < N and (current < K or A[e]):
        if not A[e]: current += 1
        e += 1
    
    answer = max(answer, e - s - current)

    if not A[s]: current -= 1
    s += 1

print(answer)

# 1 2 3 4 5 6 7 8
# 1 2 3
# 2 3 4 5
# 3 4 5
# 4 5 6 7
# 5 6 7
# 6 7 8 9
