# 7
# 1
# 5
# 2
# 10
# -99
# 7
# 5

from heapq import heappush, heappop
import sys

input = sys.stdin.read
read = input().split()
N = int(read[0])
A = list(map(int, read[1:]))
answer, maxq, minq = [], [], []

for a in A:
    heappush(maxq, -a)

    if minq and -maxq[0] > minq[0]: heappush(minq, -heappop(maxq))
    if len(maxq) > len(minq) + 1: heappush(minq, -heappop(maxq))
    elif len(minq) > len(maxq): heappush(maxq, -heappop(minq))

    answer.append(-maxq[0])

print("\n".join(map(str, answer)))