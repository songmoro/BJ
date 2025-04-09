# 3
# 10
# 20
# 40

from heapq import heapify, heappush, heappop
import sys
input = sys.stdin.readline

N = int(input())
cards = [int(input()) for _ in range(N)]
heapify(cards)

answer = 0
while len(cards) != 1:
    first, second = heappop(cards), heappop(cards)

    answer += first + second
    heappush(cards, first + second)

print(answer)