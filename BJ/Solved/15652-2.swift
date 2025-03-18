//
//  15652-2.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//3 1
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var arr = (0...N).map { $0 }
var answer = ""

func back(_ i: Int, _ current: [Int]) {
    if current.count == M {
        for n in current {
            answer.append(String(n) + " ")
        }
        answer.append("\n")
    }
    else {
        for j in i...N {
            back(j, current + [arr[j]])
        }
    }
}

back(1, [])
print(answer)
