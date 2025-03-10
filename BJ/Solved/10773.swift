//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    4
//    //    3
//    //    0
//    //    4
//    //    0
//
//    import Foundation
//
//    let K = Int(readLine()!)!
//    var stack = [Int]()
//
//    for _ in 0..<K {
//        let number = Int(readLine()!)!
//        number == 0 ? _ = stack.removeLast() : stack.append(number)
//    }
//
//    print(stack.reduce(0, +))
