# 7
# 1 6
# 1 7
# 3 2
# 3 1
# 2 4
# 2 5
# 6 1

# 1, 2, 3, 4, 5, 6, 7 -> i
# 1, 1, 3, 3, 2, 2, 6 -> d
# 6, 7, 2, 1, 4, 5, 1 -> r

# 2, 6, 3, 1, 7, 5, 4
# 1, 2, 3, 1, 6, 2, 3
# 7, 5, 2, 6, 1, 4, 1

# 2, 6, 3, 7
# 1, 2, 3, 6
# 7, 5, 2, 1

from heapq import heappop, heappush
import sys
input = sys.stdin.readline

N = int(input())
hq = []
problems = []

for _ in range(N):
    d, r = map(int, input().split(" "))
    problems.append((d, r))

problems.sort()

for d, r in problems:
    heappush(hq, r)
    if len(hq) > d: heappop(hq)

print(sum(hq))