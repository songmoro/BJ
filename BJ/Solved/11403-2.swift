//
//  11403-2.swift
//  BJ
//
//  Created by 송재훈 on 3/8/25.
//


//3
//0 1 0
//0 0 1
//1 0 0

let N = Int(readLine()!)!
var graph = [Set<Int>](repeating: [], count: N + 1)

for i in 0..<N {
    let read = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for (j, connected) in read.enumerated() where connected == 1 {
        graph[i].insert(j)
    }
}

for i in 0..<N {
    var stack = [i]
    var visit = [Bool](repeating: false, count: N)
    
    while !stack.isEmpty {
        let last = stack.removeLast()
        
        for j in graph[last] where !visit[j] {
            stack.append(j)
            visit[j] = true
        }
    }
    
    print(visit.map({ $0 ? "1" : "0" }).joined(separator: " "))
}


//1 0 1 1 1 1 1
//0 1 1 0 0 0 1
//0 0 1 0 0 0 0
//1 0 1 1 1 1 1
//1 0 1 1 1 1 1
//0 0 1 0 0 1 1
//0 0 1 0 0 0 1
//
//// 답
//1 0 1 1 1 1 1
//0 0 1 0 0 0 1
//0 0 0 0 0 0 0
//1 0 1 1 1 1 1
//1 0 1 1 1 1 1
//0 0 1 0 0 0 1
//0 0 1 0 0 0 0
