N = int(input())
A = list(map(int, input().split()))
answer, mix, left, right = [0, 0], float("inf"), 0, N - 1

while left < right:
    mid = A[left] + A[right]

    if abs(mid) < abs(mix):
        mix = mid
        answer = [A[left], A[right]]

    if 0 < mid: right -= 1
    else: left += 1

print(str(answer[0]) + " " + str(answer[1]))