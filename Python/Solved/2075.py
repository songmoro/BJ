# 5
# 12 7 9 15 5
# 13 8 11 19 6
# 21 10 26 31 16
# 48 14 28 35 25
# 52 20 32 41 49

from heapq import heappush, heappushpop

N = int(input())
heap = []

for _ in range(N):
    row = list(map(int, input().split()))
    for num in row:
        if len(heap) < N: heappush(heap, num)
        elif num > heap[0]: heappushpop(heap, num)

print(heap[0])