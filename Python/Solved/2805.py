# 4 7
# 20 15 10 17

N, M = map(int, input().split(" "))
trees = list(map(int, input().split(" ")))
answer, left, right = 0, 0, max(trees)

while left <= right:
    mid = (left + right) // 2
    if sum(max(t - mid, 0) for t in trees) >= M:
        answer = mid
        left = mid + 1
    else:
        right = mid - 1

print(answer)