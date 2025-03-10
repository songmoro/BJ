//    //
//    //  main.swift
//    //  BJ
//    //
//    //  Created by 송재훈 on 3/25/24.
//    //
//
//    //    16 2
//    //    1 1
//    //    0 1
//    //    1 1
//    //    0 2
//    //    1 2
//    //    0 2
//    //    0 3
//    //    1 3
//    //    1 4
//    //    1 3
//    //    1 3
//    //    0 6
//    //    1 5
//    //    0 5
//    //    1 5
//    //    1 6
//
//    //    12
//
//    import Foundation
//
//    let NK = readLine()!.split(separator: " ").map({ Int($0)! })
//    var dict = [Int: (Int, Int)]()
//
//    for _ in 0..<NK[0] {
//        let SY = readLine()!.split(separator: " ").map({ Int($0)! })
//        
//        if SY[0] == 0 {
//            dict[SY[1], default: (0, 0)].0 += 1
//        }
//        else {
//            dict[SY[1], default: (0, 0)].1 += 1
//        }
//    }
//
//    var answer = dict.reduce(into: 0) {
//        $0 += $1.value.0 / NK[1] + ($1.value.0 % NK[1] == 0 ? 0 : 1 )
//        $0 += $1.value.1 / NK[1] + ($1.value.1 % NK[1] == 0 ? 0 : 1 )
//    }
//
//    print(answer)
