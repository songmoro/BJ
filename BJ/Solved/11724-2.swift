//
//  11724-2.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//6 5
//1 2
//2 5
//5 1
//3 4
//4 6

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

var graph = [[Int]](repeating: [], count: N + 1)

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (uv[0], uv[1])
    graph[u].append(v)
    graph[v].append(u)
}

var answer = 0
var visit = [Bool](repeating: false, count: N + 1)

for i in 1...N where !visit[i] {
    var stack = [i]
    answer += 1
    
    while !stack.isEmpty {
        let last = stack.removeLast()
        
        for j in graph[last] where !visit[j] {
            visit[j] = true
            stack.append(j)
        }
    }
}

print(answer)
