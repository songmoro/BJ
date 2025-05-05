# 2

N = int(input())
dp = [0, 1, 2] + [0] * N
for i in range(3, N + 1): dp[i] = (dp[i - 2] + dp[i - 1]) % 10007

print(dp[N])