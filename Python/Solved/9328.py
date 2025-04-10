# 3
# 5 17
# *****************
# .............**$*
# *B*A*P*C**X*Y*.X.
# *y*x*a*p**$*$**$*
# *****************
# cz
# 5 11
# *.*********
# *...*...*x*
# *X*.*.*.*.*
# *$*...*...*
# ***********
# 0
# 7 7
# *ABCDE*
# X.....F
# W.$$$.G
# V.$$$.H
# U.$$$.J
# T.....K
# *SQPML*
# irony

from collections import deque
import sys
input = sys.stdin.readline
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

T = int(input())

for _ in range(T):
    h, w = map(int, input().split())
    building = [list(input().strip()) for _ in range(h)]
    keys = input().strip()
    
    paddingbuilding = [['.'] * (w + 2) for _ in range(h + 2)]
    for i in range(h):
        for j in range(w): paddingbuilding[i+1][j+1] = building[i][j]
    
    visited = [[False] * (w + 2) for _ in range(h + 2)]
    q = deque()
    q.append((0, 0))
    visited[0][0] = True

    door = [deque() for _ in range(26)]
    has_key = [False] * 26
    if keys != '0':
        for k in keys: has_key[ord(k) - ord('a')] = True

    result = 0

    while q:
        x, y = q.popleft()
        for d in range(4):
            nx = x + dx[d]
            ny = y + dy[d]
            if 0 <= nx < h + 2 and 0 <= ny < w + 2 and not visited[nx][ny]:
                cell = paddingbuilding[nx][ny]
                if cell == '*': continue

                visited[nx][ny] = True

                if cell == '.': q.append((nx, ny))
                elif cell == '$':
                    result += 1
                    paddingbuilding[nx][ny] = '.'
                    q.append((nx, ny))
                elif 'a' <= cell <= 'z':
                    key_index = ord(cell) - ord('a')

                    if not has_key[key_index]:
                        has_key[key_index] = True
                        while door[key_index]:
                            q.append(door[key_index].popleft())
                    q.append((nx, ny))
                    paddingbuilding[nx][ny] = '.'

                elif 'A' <= cell <= 'Z':
                    key_index = ord(cell.lower()) - ord('a')
                    if has_key[key_index]: q.append((nx, ny))
                    else: door[key_index].append((nx, ny))

    print(result)