# 5
# 5 2 4 1 3

import sys
input = sys.stdin.readline

N = int(input())
nums = list(map(int, input().split()))

pos = [0] * (N + 1)
for i in range(N): pos[nums[i]] = i

maxlen = 1
current = 1

for i in range(2, N + 1):
    if pos[i - 1] < pos[i]: current += 1
    else: current = 1
    maxlen = max(maxlen, current)

print(N - maxlen)