# 6
# 10
# 20
# 15
# 25
# 10
# 20

import sys
input = sys.stdin.readline

N = int(input())
stairs = [0] + [int(input()) for _ in range(N)]

if N <= 2: print(sum(stairs))
else:
    dp = [[0, 0] for _ in range(N + 1)]
    dp[1] = [stairs[1], 0]
    dp[2] = [stairs[2], stairs[1] + stairs[2]]

    for i in range(3, N + 1):
        dp[i][0] = max(dp[i - 2][0], dp[i - 2][1]) + stairs[i]
        dp[i][1] = max(dp[i - 1][0], dp[i - 2][1]) + stairs[i]
    print(max(dp[N]))