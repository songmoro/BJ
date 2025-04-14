# 3
# 5
# 5
# 5

import sys
input = sys.stdin.readline

N = int(input())
scores = [int(input()) for _ in range(N)]
answer = 0

for i in range(len(scores) - 2, -1, -1):
    if scores[i] >= scores[i + 1]:
        answer += scores[i] - scores[i + 1] + 1
        scores[i] = scores[i + 1] - 1

print(answer)


# 5 5
# 4 7 3
# 3 3 0 
# 2 5 3

