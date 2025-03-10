//
//  2617.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//5 4
//2 1
//4 3
//5 1
//4 2

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var heavier = [Set<Int>](repeating: [], count: N + 1)
var lighter = [Set<Int>](repeating: [], count: N + 1)

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (edge[0], edge[1])
    
    heavier[u].insert(v)
    lighter[v].insert(u)
}

for i in 1...N {
    var visit = [Bool](repeating: false, count: N + 1)
    visit[i] = true
    
    var stack = [i]
    while !stack.isEmpty {
        let last = stack.removeLast()
        
        for j in heavier[last] where !visit[j] && i != j {
            stack.append(j)
            visit[j] = true
            heavier[i].insert(j)
            lighter[j].insert(i)
        }
    }
}

var answer = 0
let half = (N / 2) + 1

for i in 1...N where heavier[i].count >= half || lighter[i].count >= half {
    answer += 1
}

print(answer)
