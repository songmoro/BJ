////
////  5567.swift
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
//var stack = (graph[1] ?? []) + (graph[1] ?? []).flatMap {
//    graph[$0]!
//}
//
//print(Set(stack).filter({ $0 != 1 }).count)
