# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

import sys
input = sys.stdin.readline
answer = set()
for i in range(10): answer.add(int(input()) % 42)
print(len(answer))