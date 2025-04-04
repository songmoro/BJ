# 3 10
# 1 2 3 4 5 6 7 8 9 10

M, N = map(int, input().split(" "))
L = list(map(int, input().split(" ")))

left, right = 1, max(L)
answer = 0

while left <= right:
    mid = (left + right) // 2
    if sum(l // mid for l in L) >= M:
        answer = mid
        left = mid + 1
    else:
        right = mid - 1

print(answer)