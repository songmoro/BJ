# 3
# 4
# 7
# 10

import sys
input = sys.stdin.readline

T = int(input())
dp = [0, 1, 2, 4] + [0] * 10
for i in range(4, 12): dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]

Ns = [int(input()) for _ in range(T)]
for N in Ns: print(dp[N])