# 4
# 14 9 12 10
# 1 11 5 4
# 7 15 2 13
# 6 3 16 8

import sys
input = sys.stdin.readline
sys.setrecursionlimit(10000)
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

N = int(input())
forest = [list(map(int, input().split(" "))) for _ in range(N)]
dp = [[-1] * N for _ in range(N)]
answer = 0

def recur(i: int, j: int):
    if dp[i][j] != -1: return dp[i][j]
    dp[i][j] = 1

    for k in range(4):
        nx, ny = i + dx[k], j + dy[k]
        if 0 <= nx < N and 0 <= ny < N and forest[i][j] < forest[nx][ny]: dp[i][j] = max(dp[i][j], recur(nx, ny) + 1)

    return dp[i][j]

for i in range(N):
    for j in range(N):
        answer = max(answer, recur(i, j))

print(answer)