# 3
# 26 40 83
# 49 60 57
# 13 89 99

import sys
input = sys.stdin.readline

N = int(input())
RGB = [[0, 0, 0]] + [list(map(int, input().split(" "))) for _ in range(N)]
dp = RGB.copy()

for i in range(1, N + 1):
    dp[i][0] += min(dp[i - 1][1:3])
    dp[i][1] += min(dp[i - 1][0], dp[i - 1][2])
    dp[i][2] += min(dp[i - 1][:2])

print(min(dp[i]))