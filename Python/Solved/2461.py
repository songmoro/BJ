# 3 4
# 12 16 67 43
# 7 17 68 48
# 14 15 77 54

N, M = map(int, input().split(" "))
students = [list(map(int, input().split(" "))) for _ in range(N)]
candidates = []

for i in range(N):
    for j in range(M):
        candidates.append((students[i][j], i))

candidates.sort()

answer = float("inf")
current = {}
left = 0

for right in range(len(candidates)):
    ability, i = candidates[right]

    if not i in current: current[i] = 0
    current[i] += 1

    while len(current) == N:
        answer = min(answer, candidates[right][0] - candidates[left][0])
        leftclass = candidates[left][1]

        current[leftclass] -= 1
        if current[leftclass] == 0: del current[leftclass]

        left += 1

print(answer)