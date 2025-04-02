# 8 30 4 30
# 7
# 9
# 7
# 30
# 2
# 7
# 9
# 25

from collections import Counter

N, d, k, c = map(int, input().split(" "))
A = [int(input()) for _ in range(N)]
counter = Counter(A)
current = Counter([c])
answer = 0
e = 0

for s in range(N):
    while e < (N + k) and e < s + k:
        current[A[e % N]] += 1
        e += 1

    answer = max(answer, len(current))

    current[A[s]] -= 1
    if A[s] != c and current[A[s]] == 0:
        del current[A[s]]

print(answer)