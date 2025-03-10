//
//  5567-2.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//6
//5
//1 2
//1 3
//3 4
//2 3
//4 5

let friends = Int(readLine()!)!
let list = Int(readLine()!)!

var relationship = [Set<Int>](repeating: [], count: friends + 1)

for _ in 0..<list {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    
    relationship[u].insert(v)
    relationship[v].insert(u)
}

var friendList = Set<Int>()
var visit = [Bool](repeating: false, count: friends + 1)

for i in relationship[1] {
    friendList.insert(i)
}

var answer: Set<Int> = [1]

for i in friendList {
    visit[i] = true
    answer.insert(i)
    
    for j in relationship[i] where !visit[j] {
        visit[j] = true
        answer.insert(j)
    }
}

print(answer.count - 1)
