////
////  main.swift
////  BJ
////
////  Created by 송재훈 on 3/25/24.
////
//
//import Foundation
//
//// 1. (x, y), (p, q)
//// 2. x > p && y > q -> 더 크다
//
//let N = Int(readLine()!)!
//var bodies = [(Int, Int)]()
//
//for _ in 0..<N {
//    let body = readLine()!.split(separator: " ").map({ Int($0)! })
//    bodies.append((body[0], body[1]))
//}
//
//bodies.forEach { body in
//    var rank = 1
//    
//    bodies.forEach {
//        if body.0 < $0.0 && body.1 < $0.1 {
//            rank += 1
//        }
//    }
//    
//    print(rank, terminator: " ")
//}
