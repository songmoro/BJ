from collections import deque

moves1 = [(-1, -2), (-2, -1), (-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2)]
moves2 = [(-1, 0), (1, 0), (0, -1), (0, 1)]

K = int(input())
W, H = map(int, input().split())
board = [input().split() for _ in range(H)]
visit = [[[-1] * (K + 1) for _ in range(W)] for _ in range(H)]
visit[0][0][K] = 0

dq = deque([(0, 0, K)])
answer = -1

while dq:
    x, y, jumps = dq.popleft()

    if x == H - 1 and y == W - 1:
        answer = visit[x][y][jumps]
        break

    for dx, dy in moves2:
        nx, ny = x + dx, y + dy

        if 0 <= nx < H and 0 <= ny < W and visit[nx][ny][jumps] == -1 and board[nx][ny] == "0":
            visit[nx][ny][jumps] = visit[x][y][jumps] + 1
            dq.append((nx, ny, jumps))

    if jumps > 0:
        for dx, dy in moves1:
            nx, ny = x + dx, y + dy

            if 0 <= nx < H and 0 <= ny < W and visit[nx][ny][jumps - 1] == -1 and board[nx][ny] == "0":
                visit[nx][ny][jumps - 1] = visit[x][y][jumps] + 1
                dq.append((nx, ny, jumps - 1))

print(answer)