//
//  14002.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//


//6
//10 20 10 30 20 50

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [Int](repeating: 1, count: N + 1)
var paths = A.map { [$0] } + []

for i in 0..<N {
    for j in 0..<i where (A[j] < A[i]) && (dp[i] < dp[j] + 1) {
        dp[i] = dp[j] + 1
        paths[i] = paths[j] + [A[i]]
    }
}

let answer = paths.max { $0.count < $1.count }!

print(answer.count)
print(answer.map(String.init).joined(separator: " "))


// MARK: 틀린 코드 및 틀렸던 이유
// -> 가장 큰 값이 아니라 가장 긴 값을 출력해야 하는데 누적합을 통해 비교해서 0%에서 항상 틀렸음
//
//let N = Int(readLine()!)!
//let A = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//var dp = [Int](repeating: 0, count: N + 1)
//var paths = [[String]]()
//
//for i in 0..<N {
//    var path = [String]()
//    
//    for j in 0..<i where (A[j] < A[i]) && (dp[i] < A[i] + dp[j]) {
//        dp[i] = A[i] + dp[j]
//        path = paths[j]
//    }
//    
//    paths.append(path + ["\(A[i])"])
//}
//
//let answer = paths.max { $0.count < $1.count }!
//
//print(answer.count)
//print(answer.joined(separator: " "))
