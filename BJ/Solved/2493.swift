//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    import Foundation
//
//    let N = Int(readLine()!)!
//
//    var array = readLine()!.split(separator: " ").map({ Int($0)! })
//    var stack: [(Int, Int)] = [(100000001, 0)]
//
//    for i in zip(array, 1...N) {
//        while stack.last!.0 <= i.0 {
//            stack.removeLast()
//        }
//        
//        print(stack.last!.1, terminator: " ")
//        stack.append((i.0, i.1))
//    }
