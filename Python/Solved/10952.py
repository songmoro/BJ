# 1 1
# 2 3
# 3 4
# 9 8
# 5 2
# 0 0

while True:
    A, B = map(int, input().split())
    if A + B == 0: break
    print(A + B)