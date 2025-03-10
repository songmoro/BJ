//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    2
//    //    <<BP<A>>Cd-
//    //    ThIsIsS3Cr3t
//
//    import Foundation
//
//    var N = Int(readLine()!)!
//
//    for _ in 0..<N {
//        var left = ""
//        var right = ""
//        
//        let str = Array(readLine()!)
//        
//        str.forEach {
//            switch $0 {
//            case "<":
//                if !left.isEmpty {
//                    right.append(left.removeLast())
//                }
//            case ">":
//                if !right.isEmpty {
//                    left.append(right.removeLast())
//                }
//            case "-":
//                if !left.isEmpty {
//                    left.removeLast()
//                }
//            default:
//                left.append($0)
//            }
//        }
//        
//        print(String(left + right.reversed()))
//    }
