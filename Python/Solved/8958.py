# 5
# OOXXOXXOOO
# OOXXOOXXOO
# OXOXOXOXOXOXOX
# OOOOOOOOOO
# OOOOXOOOOXOOOOX

import sys
input = sys.stdin.readline

T = int(input())

for _ in range(T):
    OX = list(map(str, input().rstrip().split("X")))
    answer = 0

    for O in OX:
        current = 0
        for o in O:
            current += 1
            answer += current

    print(answer)