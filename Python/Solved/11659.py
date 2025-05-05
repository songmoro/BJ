# 5 3
# 5 4 3 2 1
# 1 3
# 2 4
# 5 5

import sys
input = sys.stdin.readline

N, M = map(int, input().split(" "))
A = list(map(int, input().split(" ")))
dp = [0] * (N + 1)
for i in range(1, N + 1): dp[i] = dp[i - 1] + A[i - 1]

for _ in range(M):
    s, e = map(int, input().split(" "))
    print(dp[e] - dp[s - 1])