# 4 2
# 1 1 1 1

N, M = map(int, input().split(" "))
A = list(map(int, input().split(" ")))

s, e = 0, 0
current = 0
answer = 0

while e < N:
    while e < N and current < M:
        current += A[e]
        e += 1

    while current >= M:
        if current == M:
            answer += 1
            
        current -= A[s]
        s += 1

print(answer)