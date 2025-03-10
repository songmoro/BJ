//
//  1325.swift
//  BJ
//
//  Created by 송재훈 on 2/23/25.
//


//5 4
//3 1
//3 2
//4 3
//5 3

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])

var computers = [Int]()
var graph: [[Int]] = .init(repeating: [], count: N + 1)
var maxCount = 0
var results = [Int]()

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map({ Int($0)!})
    let (A, B) = (input[0], input[1])
    graph[B].append(A)
}

func dfs(start: Int) -> Int {
    var stack = [start]
    var visited = [Bool](repeating: false, count: N + 1)
    visited[start] = true
    var count = 1

    while !stack.isEmpty {
        let node = stack.removeLast()
        
        for next in graph[node] where !visited[next] {
            visited[next] = true
            stack.append(next)
            count += 1
        }
    }
    
    return count
}

for i in 1...N {
    let hacked = dfs(start: i)
    
    if hacked > maxCount {
        maxCount = hacked
        results = [i]
    }
    else if hacked == maxCount {
        results.append(i)
    }
}

print(results.sorted().map({ String($0) }).joined(separator: " "))
