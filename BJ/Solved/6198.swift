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
//    var stack: [Int] = [1000000001]
//    var answer = 0
//
//    for _ in 0..<N {
//        let height = Int(readLine()!)!
//        
//        while stack.last! <= height {
//            stack.removeLast()
//        }
//        
//        answer += stack.count - 1
//        
//        stack.append(height)
//    }
//
//    print(answer)
