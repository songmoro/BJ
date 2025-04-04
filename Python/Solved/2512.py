# 4
# 120 110 140 150
# 485

N = int(input())
budgets = list(map(int, input().split(" ")))
M = int(input())

answer, left, right = 0, 0, max(budgets)

while left <= right:
    mid = (left + right) // 2

    if sum(min(mid, budget) for budget in budgets) <= M:
        answer = mid
        left = mid + 1
    else:
        right = mid - 1

print(answer)