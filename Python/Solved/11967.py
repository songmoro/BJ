# 3 6
# 1 1 1 2
# 2 1 2 2
# 1 1 1 3
# 2 3 3 1
# 1 3 1 2
# 1 3 2 1

import sys
from collections import deque
input = sys.stdin.readline

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

N, M = map(int, input().split(" "))
barn = [[[] for _ in range(N + 1)] for _ in range(N + 1)]
answer = set()

for _ in range(M):
    i, j, a, b = map(int, input().split(" "))
    barn[i][j].append((a, b))
    
dq = deque([(1, 1)])
visited = [[False] * (N + 1) for _ in range(N + 1)]
turnon = [[False] * (N + 1) for _ in range(N + 1)]

answer.add((1, 1))
visited[1][1] = True
turnon[1][1] = True

while dq:
    x, y = dq.pop()

    for a, b in barn[x][y]:
        if not turnon[a][b]:
            turnon[a][b] = True
            answer.add((a, b))

            for i in range(4):
                nx, ny = a + dx[i], b + dy[i]

                if 1 <= nx <= N and 1 <= ny <= N and visited[nx][ny]:
                    visited[a][b] = True
                    dq.append((a, b))
                    break

    for i in range(4):
        nx, ny = x + dx[i], y + dy[i]

        if 1 <= nx <= N and 1 <= ny <= N and not visited[nx][ny] and turnon[nx][ny]:
            visited[nx][ny] = True
            dq.append((nx, ny))

print(len(answer))
# [(1, 2), (1, 3)] [] []
# [(2, 2)] [] []
# [] [] []