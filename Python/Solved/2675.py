# 2
# 3 ABC
# 5 /HTP

import sys
input = sys.stdin.readline

for _ in range(int(input())):
    N, word = input().split()
    answer = ""

    for c in word: answer += c * int(N)
    print(answer)