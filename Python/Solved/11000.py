# 3
# 1 3
# 2 4
# 3 5

import sys
import heapq
input = sys.stdin.readline

N = int(input())
lectures = [tuple(map(int, input().split())) for _ in range(N)]
lectures.sort()
heap = []
heapq.heappush(heap, lectures[0][1])

for i in range(1, N):
    start, end = lectures[i]

    if heap[0] <= start: heapq.heappop(heap)
    heapq.heappush(heap, end)

print(len(heap))