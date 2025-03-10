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
//    let A = readLine()!.split(separator: " ").map({ Int($0)! })
//    var stack = [Int]()
//    var answer = [Int]()
//
//    for i in stride(from: A.count - 1, to: -1, by: -1) {
//        while !stack.isEmpty, stack.last! <= A[i] {
//            stack.removeLast()
//        }
//
//        if stack.isEmpty {
//            answer.append(-1)
//        }
//        else {
//            answer.append(stack.last!)
//        }
//
//        stack.append(A[i])
//    }
//
//    print(answer.reversed().map({ String($0) }).joined(separator: " "))
