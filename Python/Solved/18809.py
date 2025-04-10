# 2 2 1 1
# 2 1
# 1 2

from itertools import combinations
from collections import deque
import sys
input = sys.stdin.readline

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

N, M, G, R = map(int, input().split())
garden = [list(map(int, input().split())) for _ in range(N)]
candidates = [(i, j) for i in range(N) for j in range(M) if garden[i][j] == 2]

def bfs(green_start, red_start):
    q = deque()
    
    green_visited = [[-1]*M for _ in range(N)]
    red_visited = [[-1]*M for _ in range(N)]
    flower_map = [[False]*M for _ in range(N)]

    for gx, gy in green_start:
        green_visited[gx][gy] = 0
        q.append((gx, gy, 0, 'G'))
    
    for rx, ry in red_start:
        red_visited[rx][ry] = 0
        q.append((rx, ry, 0, 'R'))

    flower = 0

    while q:
        x, y, t, color = q.popleft()

        if flower_map[x][y]: continue

        for d in range(4):
            nx, ny = x + dx[d], y + dy[d]

            if not (0 <= nx < N and 0 <= ny < M): continue
            if garden[nx][ny] == 0: continue
            if flower_map[nx][ny]: continue

            if color == 'G':
                if green_visited[nx][ny] != -1: continue
                if red_visited[nx][ny] != -1 and red_visited[nx][ny] == t + 1:
                    flower += 1
                    flower_map[nx][ny] = True
                    continue

                green_visited[nx][ny] = t + 1
                q.append((nx, ny, t + 1, 'G'))
            else:
                if red_visited[nx][ny] != -1: continue
                if green_visited[nx][ny] != -1 and green_visited[nx][ny] == t + 1:
                    flower += 1
                    flower_map[nx][ny] = True
                    continue

                red_visited[nx][ny] = t + 1
                q.append((nx, ny, t + 1, 'R'))
    return flower

max_flower = 0

for positions in combinations(candidates, G + R):
    for greens in combinations(positions, G):
        green_set = set(greens)
        reds = [p for p in positions if p not in green_set]

        flower = bfs(greens, reds)
        if flower > max_flower: max_flower = flower

print(max_flower)