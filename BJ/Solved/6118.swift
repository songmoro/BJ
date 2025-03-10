//
//  6118.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//6 7
//3 6
//4 3
//3 2
//1 3
//1 2
//2 4
//5 2

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var graph = [Set<Int>](repeating: [], count: N + 1)

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    
    graph[u].insert(v)
    graph[v].insert(u)
}

var (queue, index) = ([1], 0)
var visit = [Int](repeating: -1, count: N + 1)
visit[1] = 0

while index < queue.count {
    let first = queue[index]
    index += 1
    
    for i in graph[first] where visit[i] == -1 {
        queue.append(i)
        visit[i] = visit[first] + 1
    }
}

var answer = (0, 0, 0)

for (i, e) in visit.enumerated() {
    if e > answer.1 { answer = (i, e, 1) }
    else if e == answer.1 { answer.2 += 1 }
}

print(answer.0, answer.1, answer.2)
