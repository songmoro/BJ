//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    baekjoon
//    //    1 1 0 0 1 0 0 0 0 1 1 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0
//
//    import Foundation
//
//    let input = readLine()!
//
//    var dict = "abcdefghijklmnopqrstuvwxyz".enumerated().reduce(into: [:]) {
//        $0[$1.element] = 0
//    }
//
//    _ = input.map {
//        dict[$0, default: 0] += 1
//    }
//
//    dict.sorted(by: { $0.key < $1.key }).map {
//        print($0.value, terminator: " ")
//    }
