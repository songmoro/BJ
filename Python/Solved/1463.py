# 2

X = int(input())
dp = [0, 0] + [float("inf")] * X

for i in range(1, X):
    if i * 3 <= X: dp[i * 3] = min(dp[i * 3], dp[i] + 1)
    if i * 2 <= X: dp[i * 2] = min(dp[i * 2], dp[i] + 1)
    dp[i + 1] = min(dp[i + 1], dp[i] + 1)

print(dp[X])