# 5
# 3 1 4 3 2
import sys
input = sys.stdin.readline

N = int(input())
A = list(map(int, input().split(" ")))
A.sort()

time = 0
answer = []

for e in A:
    time += e
    answer.append(time)

print(sum(answer))


# 2 5 1 4 3
# 1 2 3 3 4