//
//  1260-3.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//4 5 1
//1 2
//1 3
//1 4
//2 4
//3 4

let NMV = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M, V) = (NMV[0], NMV[1], NMV[2])

var graph = [Set<Int>](repeating: [], count: N + 1)

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (uv[0], uv[1])
    
    graph[u].insert(v)
    graph[v].insert(u)
}

var (stack, queue) = ([V], [V])
var answer = (stack: [String](), queue: ["\(V)"])
var visit = [Bool](repeating: false, count: N + 1)

while !stack.isEmpty {
    let last = stack.removeLast()
    
    if visit[last] { continue }
    visit[last] = true
    answer.stack.append("\(last)")
    
    for i in graph[last].sorted(by: >) where !visit[i] {
        stack.append(i)
    }
}

visit = [Bool](repeating: false, count: N + 1)

while !queue.isEmpty {
    let first = queue.removeFirst()
    visit[first] = true
    
    for i in graph[first].sorted() where !visit[i] {
        visit[i] = true
        queue.append(i)
        answer.queue.append("\(i)")
    }
}

print(answer.stack.joined(separator: " "))
print(answer.queue.joined(separator: " "))
