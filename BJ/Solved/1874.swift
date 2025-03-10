//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    import Foundation
//
//    let n = Int(readLine()!)!
//    var stack = [Int]()
//    var answer = [String]()
//
//    var i = 1
//
//    for _ in 0..<n {
//        let number = Int(readLine()!)!
//
//        while true {
//            if number == stack.last {
//                answer.append("-")
//                stack.removeLast()
//            }
//            else if i <= number {
//                stack.append(i)
//                answer.append("+")
//                i += 1
//                continue
//            }
//
//            break
//        }
//    }
//
//    if stack.isEmpty {
//        answer.forEach {
//            print($0)
//        }
//    }
//    else {
//        print("NO")
//    }
