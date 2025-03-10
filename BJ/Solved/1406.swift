//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    abcd
//    //    3
//    //    P x
//    //    L
//    //    P y
//
//    //    abcdyx
//
//    import Foundation
//
//    var left = Array(readLine()!)
//    var right = [Character]()
//
//    let N = Int(readLine()!)!
//
//    for _ in 0..<N {
//        let command = readLine()!
//        
//        switch command {
//        case "L":
//            if !left.isEmpty {
//                right.append(left.removeLast())
//            }
//        case "D":
//            if !right.isEmpty {
//                left.append(right.removeLast())
//            }
//        case "B":
//            if !left.isEmpty {
//                left.removeLast()
//            }
//        default:
//            left.append(command.last!)
//        }
//    }
//
//    print(String((left + right.reversed())))
