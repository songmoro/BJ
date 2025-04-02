# 5
# 1 2 3 4 5

N = int(input())
A = list(map(int, input().split(" ")))

answer = 0
s, e = 0, 0
current = {}

while s < N:
    while e < N and not A[e] in current:
        current[A[e]] = 1
        e += 1

    answer += len(current)
    
    current[A[s]] -= 1
    if current[A[s]] == 0:
        del current[A[s]]

    s += 1

print(answer)


# 1 2 3 4 5
# 1
# 1 2
# 1 2 3
# 1 2 3 4
# 1 2 3 4 5
# 2
# 2 3
# 2 3 4
# 2 3 4 5
# 3
# 3 4
# 3 4 5
# 4
# 4 5
# 5