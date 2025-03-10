//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //7 3
//
//    //<3, 6, 2, 7, 5, 1, 4>
//
//    import Foundation
//
//    let NK = readLine()!.split(separator: " ").map({ Int($0)! })
//
//    var array = stride(from: 1, to: NK[0] + 1, by: 1).map({ $0 })
//    var i = 0
//
//    print("<", terminator: "")
//
//    while !array.isEmpty {
//        i += NK[1] - 1
//        i %= array.count
//        
//        print(array.remove(at: i), terminator: array.isEmpty ? ">" : ", ")
//    }
