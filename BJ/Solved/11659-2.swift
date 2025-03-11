//
//  11659-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//5 3
//5 4 3 2 1
//1 3
//2 4
//5 5

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var sum = [Int](repeating: 0, count: N + 1)
for i in 1...N { sum[i] = sum[i - 1] + numbers[i - 1] }

for _ in 0..<M {
    let range = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (i, j) = (range[0], range[1])
    let prefix = sum[j] - sum[i - 1]
    
    print(prefix)
}
