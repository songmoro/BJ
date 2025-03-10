//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    9
//    //    5 12 7 10 9 1 2 3 11
//    //    13
//
//    //    3
//
//    import Foundation
//
//    let n = Int(readLine()!)!
//    var array = Array(repeating: false, count: 2000002)
//    let a = readLine()!.split(separator: " ").map({ Int($0)! })
//    let x = Int(readLine()!)!
//
//    a.forEach {
//        array[$0] = true
//    }
//
//    let anwser = a.reduce(into: 0) { partialResult, number in
//        if x - number > 0, array[x - number] {
//            partialResult += 1
//        }
//    }
//
//    print(anwser / 2)
