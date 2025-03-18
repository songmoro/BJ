//
//  15656-2.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//3 1
//4 5 2
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var arr = [0] + readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
var current = [String]()
var answer = ""

func back(_ i: Int) {
    if current.count == M {
        answer.append(current.joined(separator: " "))
        answer.append("\n")
    }
    else {
        for j in 1...N {
            current.append(String(arr[j]))
            back(j)
            current.removeLast()
        }
    }
}

back(1)
print(answer)
