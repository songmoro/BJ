# 6 4
# 5 8 5 1
# 3 5 8 4
# 9 77 65 5
# 2 1 5 2
# 5 98 1 5
# 4 95 67 58

dx = [-1, 0, 1]

N, M = map(int, input().split())
space = [list(map(int, input().split())) for _ in range(N)]

dp = [[[float('inf')] * 3 for _ in range(M)] for _ in range(N)]

for x in range(M):
    for i in range(3):
        dp[0][x][i] = space[0][x]

for y in range(1, N):
    for x in range(M):
        for i in range(3):
            nx = x - dx[i]
            if not (0 <= nx < M): continue

            for j in range(3):
                if i != j:
                    dp[y][x][i] = min(dp[y][x][i], dp[y - 1][nx][j] + space[y][x])

answer = min(dp[N - 1][x][d] for x in range(M) for d in range(3))
print(answer)