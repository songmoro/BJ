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
//    var array = [Int]()
//    var stack = [Int]()
//
//    for _ in 0..<N {
//        array.append(Int(readLine()!)!)
//    }
//
//    print(array.reduce(into: (0, [(Int, Int)]())) {
//        var count = 1
//        
//        while !$0.1.isEmpty && $0.1.last!.0 <= $1 {
//            $0.0 += $0.1.last!.1
//            count += ($0.1.last!.0 == $1 ? $0.1.last!.1 : 0)
//            $0.1.removeLast()
//        }
//        
//        $0.0 += ($0.1.isEmpty ? 0 : 1)
//        $0.1.append(($1, count))
//    }.0)
//
//    // 2 4 1 2 2 5 1
//    // 2
//    // 4 [2]
//    // 1 [4]
//    // 2 [1 4]
//    // 2 [2 4]
//    // 5 [2 2 4]
//    // 1 [5]
//
//    // 8 8 7 7 7 6 6 7 7 7 7 9 9
//    // 8
//    // 8 [8]
//    // 7 [8]
//    // 7 [7 8]
//    // 7 [7 7 8]
//    // 6 [7]
//    // 6 [6 7]
//    // 7 [6 6 7]
//    // 7 [7]
//    // 7 [7 7]
//    // 7
//    // 9
//    // 9
