# 2

N = int(input())
dp = [0, 0] + [float("inf")] * N
path = [0] * (N + 1)

for i in range(1, N + 1):
    if i * 3 <= N and dp[i * 3] > dp[i] + 1:
        dp[i * 3] = dp[i] + 1
        path[i * 3] = i
    if i * 2 <= N and dp[i * 2] > dp[i] + 1:
        dp[i * 2] = dp[i] + 1
        path[i * 2] = i
    if i + 1 <= N and dp[i + 1] > dp[i] + 1:
        dp[i + 1] = dp[i] + 1
        path[i + 1] = i

answer = str(N) + " "
i = N

while i != 1:
    answer += str(path[i]) + " "
    i = path[i]

print(dp[N])
print(answer)