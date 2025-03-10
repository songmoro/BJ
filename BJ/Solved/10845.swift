//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    import Foundation
//
//    var queue = (0, [Int?]())
//
//    for _ in 0..<Int(readLine()!)! {
//        let command = readLine()!.split(separator: " ")
//        
//        switch command[0] {
//        case "push":
//            queue.1.append(Int(command[1])!)
//        case "pop":
//            if queue.1.compactMap({ $0 }).isEmpty {
//                print(-1)
//            }
//            else {
//                print(queue.1[queue.0]!)
//                queue.1[queue.0] = nil
//                queue.0 += 1
//            }
//        case "size":
//            print(queue.1.compactMap({ $0 }).count)
//        case "empty":
//            print(queue.1.compactMap({ $0 }).isEmpty ? 1 : 0)
//        case "front":
//            print(queue.1.compactMap({ $0 }).isEmpty ? -1 : queue.1[queue.0]!)
//        case "back":
//            print(queue.1.compactMap({ $0 }).isEmpty ? -1 : queue.1.last!!)
//        default:
//            break
//        }
//    }
