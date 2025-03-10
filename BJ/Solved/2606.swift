////
////  2606.swift
////  BJ
////
////  Created by 송재훈 on 10/1/24.
////
//
//
//let (N, M) = (Int(readLine()!)!, Int(readLine()!)!)
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
//var stack = graph[1] ?? []
//var visited: Set<Int> = [1]
//var result = 0
//
//while !stack.isEmpty {
//    let last = stack.removeLast()
//    if visited.contains(last) { continue }
//    
//    visited.insert(last)
//    result += 1
//    
//    for i in graph[last] ?? [] where !visited.contains(i) {
//        stack.append(i)
//    }
//}
//
//print(result)
//
//// 1 -> 2, 5
//// 2 -> 1, 3
//// 3 ->
//// 5 -> 6
//// 6 ->
