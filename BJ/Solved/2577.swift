//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    150
//    //    266
//    //    427
//
//    //    3
//    //    1
//    //    0
//    //    2
//    //    0
//    //    0
//    //    0
//    //    2
//    //    0
//    //    0
//
//    import Foundation
//
//    let A = Int(readLine()!)!
//    let B = Int(readLine()!)!
//    let C = Int(readLine()!)!
//
//    var dict = "0123456789".reduce(into: [:]) {
//        $0[$1] = 0
//    }
//
//    (A * B * C).description.forEach {
//        dict[$0]! += 1
//    }
//
//    dict.sorted(by: { $0.key < $1.key }).forEach {
//        print($0.value)
//    }
