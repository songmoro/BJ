////
////  11724.swift
////  BJ
////
////  Created by 송재훈 on 10/1/24.
////
//
//
//let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (N, M) = (input1[0], input1[1])
//
//var graph = [Int: [Int]]()
//for _ in 0..<M {
//    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
//    let (u, v) = (input2[0], input2[1])
//    
//    graph[u, default: []].append(v)
//    graph[v, default: []].append(u)
//}
//
//var result = 0
//var visited = [Bool](repeating: false, count: 1010)
//
//for i in 1...N where !visited[i] {
//    var stack = graph[i] ?? []
//    result += 1
//    visited[i] = true
//    
//    while !stack.isEmpty {
//        let last = stack.removeLast()
//        visited[last] = true
//        
//        for j in graph[last] ?? [] where !visited[j] {
//            stack.append(j)
//            visited[j] = true
//        }
//    }
//}
//
//print(result)
