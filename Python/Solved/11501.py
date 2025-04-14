# 3
# 3
# 10 7 6
# 3
# 3 5 9
# 5
# 1 1 3 1 2

import sys
input = sys.stdin.readline

def solution():
    N = int(input())

    stocks = list(map(int, input().split(" ")))
    answer = 0
    last = N - 1

    for i in reversed(range(N)):
        if stocks[last] > stocks[i]: answer += stocks[last] - stocks[i]
        else: last = i
    
    print(answer)

for _ in range(int(input())):
    solution()