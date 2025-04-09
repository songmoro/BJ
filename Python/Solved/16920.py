# 3 3 2
# 1 1
# 1..
# ...
# ..2

import sys
from collections import deque
input = sys.stdin.readline

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

N, M, P = map(int, input().split())
S = [0] + list(map(int, input().split()))
grid = [list(input().strip()) for _ in range(N)]

q = [deque() for _ in range(P + 1)]
answer = [0] * (P + 1)

for i in range(N):
    for j in range(M):
        if grid[i][j].isdigit():
            pid = int(grid[i][j])
            q[pid].append((i, j))
            answer[pid] += 1

while any(p for p in q):
    for pid in range(1, P + 1):
        limit = S[pid]
        nextq = deque()
        currentq = q[pid]
        
        for _ in range(limit):
            changed = False

            for _ in range(len(currentq)):
                x, y = currentq.popleft()
                
                for dir in range(4):
                    nx, ny = x + dx[dir], y + dy[dir]
                    if 0 <= nx < N and 0 <= ny < M and grid[nx][ny] == ".":
                        grid[nx][ny] = str(pid)
                        nextq.append((nx, ny))
                        answer[pid] += 1
                        changed = True
            currentq, nextq = nextq, deque()

            if not changed: break

        q[pid] = currentq

print(" ".join(map(str, answer[1:])))