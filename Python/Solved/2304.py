# 7
# 2 4
# 11 4
# 15 8
# 4 6
# 5 3
# 8 10
# 13 6
import sys
input = sys.stdin.readline

N = int(input())
LH = [tuple(map(int, input().split())) for _ in range(N)]
LH.sort()

Ls = [l for l, h in LH]
Hs = [0] * (Ls[-1] + 2)
for l, h in LH: Hs[l] = h

H = max(Hs)
Hindex = Hs.index(H)

answer = 0
current = 0

for i in range(Ls[0], Hindex + 1):
    if Hs[i] > current: current = Hs[i]
    answer += current

current = 0
for i in range(Ls[-1], Hindex, -1):
    if Hs[i] > current: current = Hs[i]
    answer += current

print(answer)