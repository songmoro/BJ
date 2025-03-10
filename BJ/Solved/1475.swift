//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    9999
//    //    2
//
//    //    122
//    //    2
//
//    //    12635
//    //    1
//
//    //    888888
//    //    6
//
//    import Foundation
//
//    let N = readLine()!
//
//    var dict = "0123456789".reduce(into: [:]) {
//        $0[$1] = 0
//    }
//
//    N.forEach {
//        if $0 == "6" || $0 == "9" {
//            (dict["6"]! > dict["9"]!) ? (dict["9"]! += 1) : (dict["6"]! += 1)
//        }
//        else {
//            dict[$0]! += 1
//        }
//    }
//
//    print(dict.max(by: { $0.value <= $1.value })!.value)
