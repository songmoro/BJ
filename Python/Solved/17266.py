# 5
# 2
# 2 4

N = int(input())
M = int(input())
lamps = list(map(int, input().split(" ")))
left, right = 0, N + 1
answer = float("inf")

while left <= right:
    s, mid = 0, (left + right) // 2

    for lamp in lamps:
        if s >= lamp - mid: s = lamp + mid
        else: break

    if s >= N:
        answer = min(answer, mid)
        right = mid - 1
    else:
        left = mid + 1

print(answer)