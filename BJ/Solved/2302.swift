//
//  2302.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//


//9
//2
//4
//7

// MARK: 풀이
// vip가 없다고 가정했을 때,
// n = 5 라면
// 1, 1, 2, 3, 5로 피보나치와 같은 양상을 띔
// -> 여기서 vip를 제외한 연속 자리 수의 곱 도출 가능
// MARK: 다른 풀이
// n에 앉은 사람이 n - 1과 자리 변경하지 않는 경우
// 이 경우 앞쪽 n - 1개 좌석은 그대로 유지되어야함
// -> dp[n] = dp[n - 1]
// n에 앉은 사람이 n - 1과 자리 변경하는 경우
// 이 경우 앞쪽 n - 2개 좌석은 n - 2개 좌석을 유지하고 있음
//
// ---> 결과적으로 dp[n]은 n - 1과 자리를 변경하거나(n - 2) 변경하지 않는다(n - 1).
// ---> 즉, n - 1의 경우의 수와 n - 2의 경우의 수를 합친 것
// ---> 그러므로 피보나치 수열 점화식과 같아짐

let N = Int(readLine()!)!
let VIP = Int(readLine()!)!
var VIPs = [Int]()

for _ in 0..<VIP {
    let n = Int(readLine()!)!
    VIPs.append(n)
}

var dp = [1, 1] + [Int](repeating: 0, count: 40)
for i in 2...40 { dp[i] = dp[i - 2] + dp[i - 1] }

var (answer, j) = (1, 0)

for i in VIPs {
    answer *= dp[i - j - 1]
    j = i
}

print(answer * dp[N - j])

//9
//2
//4
//7
//
//1 2 3 4 5 6 7 8 9
//1 1 1 0 1 1 0 1 1
//
//1 2 3 4
//2 1 3 4
//1 3 2 4
//
//4 5 6
//4 6 5
//
//7 8 9
//7 9 8

//9
//2
//5
//7
//
//1 2 3 4 5 6 7 8 9
//1 1 1 1 0 1 0 1 1

//1 2 3 4
//
//1 3 2 4
//2 1 3 4
//
//1 2 4 3
//
//7 8 9
//7 9 8
