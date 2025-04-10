# 3
# 8 5
# 1 100
# 3 5

import sys
input = sys.stdin.readline

N = int(input())
eggs = [list(map(int, input().split(" "))) for _ in range(N)]
current = eggs.copy()
broken = [False] * N
answer = 0

def backtracking(i: int):
    global answer

    if i == N:
        answer = max(answer, sum(broken))
        return
    
    if broken[i]:
        backtracking(i + 1)
        return
    
    isallbroken = True
    for j in range(N):
        if i == j or broken[j]: continue
        isallbroken = False

        current[i][0] -= current[j][1]
        current[j][0] -= current[i][1]

        if current[i][0] <= 0: broken[i] = True
        if current[j][0] <= 0: broken[j] = True

        backtracking(i + 1)

        current[i][0] += current[j][1]
        current[j][0] += current[i][1]
        broken[i] = False
        broken[j] = False
    
    if isallbroken: backtracking(i + 1)

backtracking(0)
print(answer)

# 가장 왼쪽의 계란을 든다.
# 손에 들고 있는 계란으로 깨지지 않은 다른 계란 중에서 하나를 친다.
#   단, 손에 든 계란이 깨졌거나 깨지지 않은 다른 계란이 없으면 치지 않고 넘어간다.
#   이후 손에 든 계란을 원래 자리에 내려놓고 3번 과정을 진행한다.
# 가장 최근에 든 계란의 한 칸 오른쪽 계란을 손에 들고 2번 과정을 다시 진행한다.
#   단, 가장 최근에 든 계란이 가장 오른쪽에 위치한 계란일 경우 계란을 치는 과정을 종료한다.