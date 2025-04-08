# 3
# 4
# 7
# 10

# 4 -> 4
# 7 -> 8
# 10 -> 14

T = int(input())
cases = [int(input()) for _ in range(T)]

dp = [1] + [0] * max(cases)

for n in [1, 2, 3]:
    for i in range(n, max(cases) + 1):
        dp[i] += dp[i - n]

for n in cases: print(dp[n])