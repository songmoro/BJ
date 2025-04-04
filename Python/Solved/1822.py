# 4 3
# 2 5 11 7
# 9 7 4

nA, nB = map(int, input().split(" "))
A = sorted(list(map(int, input().split(" "))))
B = set(map(int, input().split(" ")))

answer = [str(x) for x in A if x not in B]

print(len(answer))
if answer: print(" ".join(answer))