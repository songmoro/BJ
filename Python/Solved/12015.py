# 6
# 10 20 10 30 20 50

N = int(input())
A = list(map(int, input().split(" ")))
sub = []

def binary_search(target):
    left, right = 0, len(sub) - 1

    while left < right:
        mid = (left + right) // 2
        if sub[mid] < target: left = mid + 1
        else: right = mid
    return left

for num in A:
    if not sub or sub[-1] < num:
        sub.append(num)
    else:
        idx = binary_search(num)
        sub[idx] = num

print(len(sub))