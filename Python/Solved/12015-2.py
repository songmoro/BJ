from bisect import bisect_left  

N = int(input())  
A = list(map(int, input().split()))  

sub = []

for num in A:
    idx = bisect_left(sub, num)
    if idx == len(sub): sub.append(num)
    else: sub[idx] = num

print(len(sub))