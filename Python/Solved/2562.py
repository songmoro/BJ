# 3
# 29
# 38
# 12
# 57
# 74
# 40
# 85
# 61

answer = (-1, -1)

for i in range(9):
    number = int(input())
    if answer[0] < number: answer = (number, i + 1)

print(answer[0])
print(answer[1])