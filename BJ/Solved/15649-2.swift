//
//  15649-2.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//3 1
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var arr = (0...N).map { $0 }
var visit = [Bool](repeating: false, count: N + 1)

func back(_ i: Int, _ current: [Int]) {
    if current.count == M {
        print(current.map({ String($0) }).joined(separator: " "))
    }
    else {
        for j in 1...N where !visit[j] {
            visit[j] = true
            back(j, current + [arr[j]])
            visit[j] = false
        }
    }
}

back(0, [])

