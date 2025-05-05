# 3
# 4
# 7
# 10

import sys
input = sys.stdin.readline

T = int(input())
ns = [int(input()) for _ in range(T)]
dp = [0, 1, 2, 4] + [0] * 11

for i in range(4, 11): dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1]
for n in ns: print(dp[n])