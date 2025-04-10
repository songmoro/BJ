# 5
# 4 1 5 2 3
# 5
# 1 3 7 9 5

import sys
input = sys.stdin.readline

N = int(input())
A = list(map(int, input().split(" ")))
A.sort()
M = int(input())
X = list(map(int, input().split(" ")))
answer = []

for x in X:
    left, right = 0, N

    while left < right:
        mid = (left + right) // 2

        if A[mid] == x:
            left = mid
            break
        elif A[mid] < x: left = mid + 1
        elif A[mid] > x: right = mid
    
    answer.append("1" if left < N and x == A[left] else "0")

print("\n".join(answer))