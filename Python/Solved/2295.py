# 5
# 2
# 3
# 5
# 10
# 18

import sys
input = sys.stdin.readline

N = int(input())
A = [int(input()) for _ in range(N)]
A.sort()
U = set([A[i] + A[j] for j in range(N) for i in range(N)])

answer = 0

for i in range(N):
    for j in range(i):
        if A[i] - A[j] in U: answer = max(answer, A[i])

print(answer)