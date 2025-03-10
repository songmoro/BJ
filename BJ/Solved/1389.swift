//
//  1389.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//5 5
//1 3
//1 4
//4 5
//4 3
//3 2

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var graph = [Set<Int>](repeating: [], count: N + 1)

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    
    graph[u].insert(v)
    graph[v].insert(u)
}

var answer = (Int.max, [Int]())

for i in 1...N {
    var queue = [i]
    var visit = [Int](repeating: 0, count: N + 1)
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        for j in graph[first] where visit[j] == 0 && i != j {
            visit[j] = visit[first] + 1
            queue.append(j)
        }
    }
    
    let kevin = visit.reduce(0, +)
    
    if answer.0 > kevin { answer = (kevin, [i]) }
    else if answer.0 == kevin { answer.1.append(i) }
}

print(answer.1.min()!)
