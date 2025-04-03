# 4 25
# 0 10
# 3 15
# 0 8
# 3 10

N, K = map(int, input().split(" "))
lines = [list(map(int, input().split(" "))) for _ in range(N)]
sector = [0] * (1000000 + 1)

for a, b in lines:
    sector[a] += 1
    sector[b] -= 1

for i in range(1, 1000000 + 1):
    sector[i] += sector[i - 1]

left, right = 0, 0
current = 0
answerA, answerB = -1, -1

while right < 1000001:
    while right < 1000001 and current < K:
        current += sector[right]
        right += 1
    
    while left < right and current >= K:
        if current == K:
            if answerA == -1 or (left < answerA) or (left == answerA and right < answerB):
                answerA, answerB = left, right
        
        current -= sector[left]
        left += 1

if [answerA, answerB] == [-1, -1]:
    print("0 0")
else:
    print(str(answerA) + " " + str(answerB))