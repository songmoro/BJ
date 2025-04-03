# 5
# 3 5 2 5 9

N = int(input())
snowballs = sorted(list(map(int, input().split(" "))))
answer = float("inf")
snowmen = []

for i in range(N - 1):
    for j in range(i + 1, N):
        snowmen.append((snowballs[i] + snowballs[j], i, j))

snowmen.sort()

for i in range(len(snowmen) - 1):
    h1, i1, j1 = snowmen[i]
    h2, i2, j2 = snowmen[i + 1]
    if i1 != i2 and j1 != j2: answer = min(answer, abs(h1 - h2))

print(answer)