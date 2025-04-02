# 4 3
# 1
# 5
# 2
# 3

N, M = map(int, input().split(" "))
A = [int(input()) for _ in range(N)]
A.sort()

answer = float("inf")
left, right = 0, 0

while right < N:
    if A[right] - A[left] >= M:
        answer = min(A[right] - A[left], answer)
        left += 1
    else:
        right += 1
    
    if left == right:
        right += 1

print(answer)