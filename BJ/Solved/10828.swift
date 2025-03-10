//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    14
//    //    push 1
//    //    push 2
//    //    top
//    //    size
//    //    empty
//    //    pop
//    //    pop
//    //    pop
//    //    size
//    //    empty
//    //    pop
//    //    push 3
//    //    empty
//    //    top
//
//    import Foundation
//
//    let N = Int(readLine()!)!
//    var stack = [String]()
//
//    for _ in 0..<N {
//        let command = readLine()!.split(separator: " ")
//        
//        switch command[0] {
//        case "push":
//            stack.append(String(command[1]))
//        case "pop":
//            print(stack.popLast() ?? -1)
//        case "size":
//            print(stack.count)
//        case "empty":
//            print(stack.isEmpty ? 1 : 0)
//        default:
//            print(stack.last ?? -1)
//        }
//    }
