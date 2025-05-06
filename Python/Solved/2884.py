# 10 10
# 9 25

H, M = map(int, input().split())
current = 24 * 60 + H * 60 + M - 45
print(current // 60 % 24, current % 60)