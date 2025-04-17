# 3 2
# 1 65
# 5 23
# 2 99
# 10
# 2

from heapq import heappop, heappush
import sys
input = sys.stdin.readline

N, K = map(int, input().split())
gems = [tuple(map(int, input().split())) for _ in range(N)]
bags = [int(input()) for _ in range(K)]

gems.sort()
bags.sort()

answer = 0
heap = []
i = 0

for c in bags:
    while i < N and gems[i][0] <= c:
        heappush(heap, -gems[i][1])
        i += 1
    if heap: answer -= heappop(heap)

print(answer)
