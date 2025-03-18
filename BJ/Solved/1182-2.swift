//
//  1182-2.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//5 0
//-7 -3 -2 5 8

let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, S) = (NS[0], NS[1])
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = (S == 0 ? -1 : 0)

func back(_ i: Int, _ current: Int) {
    if i == N { answer += current == S ? 1 : 0 }
    else {
        back(i + 1, current + numbers[i])
        back(i + 1, current)
    }
}

back(0, 0)
print(answer)
