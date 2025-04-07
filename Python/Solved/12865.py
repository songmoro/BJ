# 4 7
# 6 13
# 4 8
# 3 6
# 5 12

N, K = map(int, input().split(" "))
items = [list(map(int, input().split(" "))) for _ in range(N)]
dp = [0] * (K + 1)

for w, v in items:
    for k in range(K, w - 1, -1):
        if dp[k] < dp[k - w] + v: dp[k] = dp[k - w] + v

print(dp[K])

#   0  6  4  3  5
# 1 0  0  0  0  0
# 2 0  0  0  0  0
# 3 0  0  0  6  6
# 4 0  0  8  8  8
# 5 0  0  8  8 12
# 6 0 13 13 13 13
# 7 0 13 13 14 14