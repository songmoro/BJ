# 4
# 1 1 5 31
# 1 1 6 30
# 5 15 8 31
# 6 10 12 10

import sys
input = sys.stdin.readline

N = int(input())
flowers = []

for _ in range(N):
    sm, sd, em, ed = map(int, input().split())
    start = sm * 100 + sd
    end = em * 100 + ed
    flowers.append((start, end))

flowers.sort()

s = 301
e = 1201
answer = 0
i = 0
current = 0

while s < e:
    found = False

    while i < N and flowers[i][0] <= s:
        if flowers[i][1] > current:
            current = flowers[i][1]
            found = True
        i += 1

    if not found: break

    answer += 1
    s = current

if current < e: print(0)
else: print(answer)

