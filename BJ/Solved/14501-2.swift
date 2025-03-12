//
//  14501-2.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//


//7
//3 10
//5 20
//1 10
//1 20
//2 15
//4 40
//2 200

// MARK: dp[i + 1] = max(dp[i + 1], dp[i])
// 이 구문이 없으면 상담을 하지 않은 경우의 최적해가 유지되지 않음.
// 즉, 상담을 선택하지 않는다면, dp[i]의 값을 그대로 다음 날로 넘겨야 함.
//
// 이 문제는 “상담을 할 수도 있고, 안 할 수도 있는” 선택적 문제

// 만약, 아래와 같이 코드를 작성하면
// dp[i] = max(dp[i], dp[i-T[i]] + P[i])
//
// 이 방식은 “상담을 선택하는 경우만 고려” 하기 때문에, 상담을 하지 않고 넘어가는 경우를 고려하지 않음.

let N = Int(readLine()!)!
var counseling: [(day: Int, pay: Int)] = [(0, 0)]
var dp = [Int](repeating: 0, count: N + 2)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (day, pay) = (input[0], input[1])
    
    counseling.append((day, pay))
}


for i in 1...N {
    let (day, pay) = (counseling[i].day + i, counseling[i].pay + dp[i])
    if day <= N + 1, dp[day] < pay { dp[day] = pay }
    
    dp[i + 1] = max(dp[i], dp[i + 1])
}

print(dp[N + 1])
//print(dp.reduce(0, +))
