# 4
# 1 3
# 2 5
# 3 5
# 6 7

import sys
input = sys.stdin.readline

N = int(input())
lines = [tuple(map(int, input().split())) for _ in range(N)]
lines.sort()

answer = 0
start, end = lines[0]

for x, y in lines[1:]:
    if x <= end: end = max(end, y)
    else:
        answer += end - start
        start, end = x, y

answer += end - start
print(answer)
