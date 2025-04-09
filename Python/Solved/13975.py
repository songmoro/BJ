# 2
# 4
# 40 30 30 50
# 15
# 1 21 3 4 5 35 5 4 3 5 98 21 14 17 32

from heapq import heapify, heappush, heappop
import sys
input = sys.stdin.readline

T = int(input())

for _ in range(T):
    N = int(input())
    files = list(map(int, input().split(" ")))
    heapify(files)

    answer = 0

    while len(files) != 1:
        first, second = heappop(files), heappop(files)
        result = first + second

        heappush(files, result)
        answer += result
    
    print(answer)