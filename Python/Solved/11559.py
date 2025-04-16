# ......
# ......
# ......
# ......
# ......
# ......
# ......
# ......
# .Y....
# .YG...
# RRYG..
# RRYGG.

from collections import deque
import sys
input = sys.stdin.readline
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

lines = [list(map(str, input().strip())) for _ in range(12)]
answer = 0

while True:
    popped = False

    for i in range(12):
        for j in range(6):
            visited = [[False] * 6 for _ in range(12)]
            visited[i][j] = True
            if lines[i][j] == ".": continue

            dq = deque([(i, j)])
            remove = [(i, j)]

            while dq:
                x, y = dq.pop()

                for k in range(4):
                    nx, ny = x + dx[k], y + dy[k]
                    
                    if not (0 <= nx < 12) or not (0 <= ny < 6): continue
                    if visited[nx][ny]: continue
                    visited[nx][ny] = True
                    if lines[nx][ny] != lines[i][j]: continue

                    dq.append((nx, ny))
                    remove.append((nx, ny))

            if len(remove) >= 4:
                popped = True
                for x, y in remove: lines[x][y] = "."

    for j in range(6):
        while True:
            need = False

            for i in range(11, 0, -1):
                if lines[i][j] == "." and lines[i - 1][j] != ".":
                    need = True
                    lines[i][j] = lines[i - 1][j]
                    lines[i - 1][j] = "."

            if not need: break

    if popped: answer += 1
    else: break

print(answer)