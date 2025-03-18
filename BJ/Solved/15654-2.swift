//
//  15654-2.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//3 1
//4 5 2
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var arr = [0] + readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
var visit = [Bool](repeating: false, count: N + 2)
var answer = ""

func back(_ i: Int, _ current: [Int]) {
    if current.count == M {
        for n in current {
            answer.append(String(n) + " ")
        }
        answer.append("\n")
    }
    else {
        for j in 1...N where !visit[j] {
            visit[j] = true
            back(j, current + [arr[j]])
            visit[j] = false
        }
    }
}

back(1, [])
print(answer)
