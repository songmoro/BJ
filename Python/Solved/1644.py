def sieve(limit):
    primes = []
    is_prime = [True] * (limit + 1)
    is_prime[0] = is_prime[1] = False

    for i in range(2, limit + 1):
        if is_prime[i]:
            primes.append(i)
            for j in range(i * i, limit + 1, i):
                is_prime[j] = False
    return primes

N = int(input())
A = sieve(N)

s, e, current, answer = 0, 0, 0, 0

while e < len(A):
    while e < len(A) and current < N:
        current += A[e]
        e += 1
    
    while s < len(A) and current >= N:
        if current == N:
            answer += 1
        current -= A[s]
        s += 1

print(answer)
