# 11
# 1 4
# 3 5
# 0 6
# 5 7
# 3 8
# 5 9
# 6 10
# 8 11
# 8 12
# 2 13
# 12 14

import sys
input = sys.stdin.readline

N = int(input())
times = [list(map(int, input().split(" "))) for _ in range(N)]
times.sort(key = lambda x: (x[1], x[0]))
answer = [(-1, -1)]

for s, e in times:
    if answer[-1][1] <= s: answer.append((s, e))

print(len(answer) - 1)
# 3
# 1 2
# 2 2
# 2 3