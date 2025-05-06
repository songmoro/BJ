# 7 3
# 2 0 0 0 1 1 0
# 0 0 1 0 1 2 0
# 0 1 1 0 1 0 0
# 0 1 0 0 0 0 0
# 0 0 0 2 0 1 1
# 0 1 0 0 0 0 0
# 2 1 0 0 0 0 2

from collections import deque
from itertools import combinations
import sys
input = sys.stdin.readline
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

N, M = map(int, input().split())
board = [list(map(int, input().split())) for _ in range(N)]

virus = []
emptycount = -M

for i in range(N):
    for j in range(N):
        if board[i][j] == 2:
            virus.append((i, j))
            emptycount += 1
        elif board[i][j] == 0:
            emptycount += 1

def bfs(viruses):
    visited = [[-1] * N for _ in range(N)]
    dq = deque()

    for x, y in viruses:
        dq.append((x, y))
        visited[x][y] = 0

    maxtime = 0
    filled = 0

    while dq:
        x, y = dq.popleft()

        for d in range(4):
            nx, ny = x + dx[d], y + dy[d]
            if 0 <= nx < N and 0 <= ny < N:
                if board[nx][ny] != 1 and visited[nx][ny] == -1:
                    visited[nx][ny] = visited[x][y] + 1
                    dq.append((nx, ny))

                    if board[nx][ny] != 1:
                        filled += 1
                        maxtime = visited[nx][ny]

    return maxtime if filled == emptycount else float('inf')

answer = float('inf')

for combi in combinations(virus, M):
    answer = min(answer, bfs(combi))

print(-1 if answer == float('inf') else answer)