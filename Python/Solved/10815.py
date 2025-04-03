# 5
# 6 3 2 10 -10
# 8
# 10 9 -5 2 3 4 5 -10

N = int(input())
cards = list(map(int, input().split(" ")))
cards.sort()
M = int(input())
targets = list(map(int, input().split(" ")))
answer = []

for target in targets:
    left, right = 0, N
    current = "0"

    while left < right and left < N:
        mid = (left + right) // 2

        if target == cards[mid]:
            current = "1"
            break
        elif target < cards[mid]:
            right = mid
        else:
            left = mid + 1

    answer.append(current)

print(" ".join(answer))