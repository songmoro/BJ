//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    aabbcc
//    //    xxyybb
//
//    import Foundation
//
//    var dict = "abcdefghijklmnopqrstuvwxyz".reduce(into: [Character: (Int, Int)]()) {
//        $0[$1] = (0, 0)
//    }
//
//    readLine()!.forEach {
//        dict[$0]!.0 += 1
//    }
//    readLine()!.forEach {
//        dict[$0]!.1 += 1
//    }
//
//    print(dict.reduce(into: 0) {
//        $0 += abs($1.value.0 - $1.value.1)
//    })
//
