//
//  2606-2.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//7
//6
//1 2
//2 3
//1 5
//5 2
//5 6
//4 7

let computers = Int(readLine()!)!
let connects = Int(readLine()!)!

var networks = [Set<Int>](repeating: [], count: computers + 1)

for _ in 0..<connects {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    
    networks[u].insert(v)
    networks[v].insert(u)
}

var answer = 0
var stack = [1]
var visit = [Bool](repeating: false, count: computers + 1)

while !stack.isEmpty {
    let last = stack.removeLast()
    
    if visit[last] { continue }
    visit[last] = true
    answer += 1
    
    for i in networks[last] where !visit[i] {
        stack.append(i)
    }
}

print(answer - 1)
