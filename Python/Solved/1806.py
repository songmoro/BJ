# 10 15
# 5 1 3 5 10 7 4 9 2 8

N, S = map(int, input().split(" "))
A = list(map(int, input().split(" ")))

answer = float("inf")
i, j = 0, 0
current = 0

while j < N:
    while j < N and current < S:
        current += A[j]
        j += 1

    while current >= S:
        answer = min(answer, j - i)
        current -= A[i]
        i += 1

print(answer if answer != float("inf") else 0)