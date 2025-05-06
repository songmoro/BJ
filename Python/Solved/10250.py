# 2
# 6 12 10
# 30 50 72

# 402
# 1203

import sys
input = sys.stdin.readline

T = int(input())
for _ in range(T):
    H, W, N = map(int, input().split())
    F = N % H
    R = N // H + 1

    if F == 0:
        F = H
        R -= 1

    if R >= 10:
        print(str(F) + str(R))
    else:
        print(str(F) + "0" + str(R))

