////
////  11403.swift
////  BJ
////
////  Created by 송재훈 on 10/1/24.
////
//
//
//let N = Int(readLine()!)!
//
//var connects = [Int: Set<Int>]()
//var graph: [[Int]] = (1...N).map { i in
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    
//    for j in 1...N where input[j - 1] == 1 {
//        connects[i, default: []].insert(j)
//    }
//    
//    return input
//}
//
//for i in 1...N {
//    var stack = connects[i] ?? []
//    var visited: Set<Int> = [i]
//    
//    while let last = stack.popFirst() {
//        if visited.contains(last) { continue }
//        visited.insert(last)
//        
//        for j in connects[last] ?? [] {
//            stack.insert(j)
//            connects[i, default: []].insert(j)
//        }
//    }
//    
//    for j in connects[i] ?? [] {
//        graph[i - 1][j - 1] = 1
//    }
//    
//    for j in graph[i - 1] {
//        print(j, terminator: " ")
//    }
//    print()
//}
